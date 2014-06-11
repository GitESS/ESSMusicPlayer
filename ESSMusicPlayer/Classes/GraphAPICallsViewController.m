#import "GraphAPICallsViewController.h"

@interface GraphAPICallsViewController ()

@end

@implementation GraphAPICallsViewController

static GraphAPICallsViewController *gInstance = NULL;
+ (GraphAPICallsViewController *)sharedInstance
{
	@synchronized(self)
	{
		if (gInstance == NULL) 
			gInstance = [[self alloc] init];
	}
    
	return gInstance;
}

- (void) viewDidLoad {
    [_fbLoginView setReadPermissions:@[@"basic_info"]];
    [_fbLoginView setDelegate:self];
    _objectID = nil;
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
    self.profilePictureView.profileID = user.id;
    self.nameLabel.text = user.name;
}

// Implement the loginViewShowingLoggedInUser: delegate method to modify your app's UI for a logged-in user experience
- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
    NSLog(@"User logged in");
    [_requestUserInfoButton setHidden:NO];
    [_requestObjectButton setHidden:NO];
    [_postObjectButton setHidden:NO];
    [_postOGStoryButton setHidden:NO];
    [_deleteObjectButton setHidden:NO];
    [self requestUserInfo:self];
}

// Implement the loginViewShowingLoggedOutUser: delegate method to modify your app's UI for a logged-out user experience
- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
    NSLog(@"User logged out");
    self.profilePictureView.profileID = nil;
    self.nameLabel.text = @"";
    [_requestUserInfoButton setHidden:YES];
    [_requestObjectButton setHidden:YES];
    [_postObjectButton setHidden:YES];
    [_postOGStoryButton setHidden:YES];
    [_deleteObjectButton setHidden:YES];
}

// You need to override loginView:handleError in order to handle possible errors that can occur during login
- (void)loginView:(FBLoginView *)loginView handleError:(NSError *)error {
    NSString *alertMessage, *alertTitle;
    
    // If the user should perform an action outside of you app to recover,
    // the SDK will provide a message for the user, you just need to surface it.
    // This conveniently handles cases like Facebook password change or unverified Facebook accounts.
    if ([FBErrorUtility shouldNotifyUserForError:error]) {
        alertTitle = @"Facebook error";
        alertMessage = [FBErrorUtility userMessageForError:error];
        
        // This code will handle session closures since that happen outside of the app.
        // You can take a look at our error handling guide to know more about it
        // https://developers.facebook.com/docs/ios/errors
    } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryAuthenticationReopenSession) {
        alertTitle = @"Session Error";
        alertMessage = @"Your current session is no longer valid. Please log in again.";
        
        // If the user has cancelled a login, we will do nothing.
        // You can also choose to show the user a message if cancelling login will result in
        // the user not being able to complete a task they had initiated in your app
        // (like accessing FB-stored information or posting to Facebook)
    } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryUserCancelled) {
        NSLog(@"user cancelled login");
        
        // For simplicity, this sample handles other errors with a generic message
        // You can checkout our error handling guide for more detailed information
        // https://developers.facebook.com/docs/ios/errors
    } else {
        alertTitle  = @"Something went wrong";
        alertMessage = @"Please try again later.";
        NSLog(@"Unexpected error:%@", error);
    }
    
    if (alertMessage) {
        [[[UIAlertView alloc] initWithTitle:alertTitle
                                    message:alertMessage
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }
}

// ------------> Login code ends here <------------


// ------------> Code for requesting user information starts here <------------

/*
 This function asks for the user's public profile and birthday.
 It first checks for the existence of the basic_info and user_birthday permissions
 If the permissions are not present, it requests them
 If/once the permissions are present, it makes the user info request
 */

- (IBAction)requestUserInfo:(id)sender
{
    // We will request the user's public picture and the user's birthday
    // These are the permissions we need:
    NSArray *permissionsNeeded = @[@"basic_info", @"user_birthday",@"status_update"];
    
    // Request the permissions the user currently has
    [FBRequestConnection startWithGraphPath:@"/me/permissions"
                          completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                              if (!error){
                                  // These are the current permissions the user has
                                  NSDictionary *currentPermissions= [(NSArray *)[result data] objectAtIndex:0];
                                  
                                  // We will store here the missing permissions that we will have to request
                                  NSMutableArray *requestPermissions = [[NSMutableArray alloc] initWithArray:@[]];
                                  
                                  // Check if all the permissions we need are present in the user's current permissions
                                  // If they are not present add them to the permissions to be requested
                                  for (NSString *permission in permissionsNeeded){
                                      if (![currentPermissions objectForKey:permission]){
                                          [requestPermissions addObject:permission];
                                      }
                                  }
                                  
                                  // If we have permissions to request
                                  if ([requestPermissions count] > 0){
                                      // Ask for the missing permissions
                                      
                                      [FBSession.activeSession
                                       requestNewReadPermissions:requestPermissions
                                       completionHandler:^(FBSession *session, NSError *error) {
                                           if (!error) {
                                               // Permission granted, we can request the user information
                                               [self makeRequestForUserData];
                                           } else {
                                               // An error occurred, we need to handle the error
                                               // Check out our error handling guide: https://developers.facebook.com/docs/ios/errors/
                                               NSLog(@"%@",[NSString stringWithFormat:@"error %@", error.description]);
                                           }
                                       }];
                                  } else {
                                      // Permissions are present
                                      // We can request the user information
                                      [self makeRequestForUserData];
                                  }
                                  
                              } else {
                                  // An error occurred, we need to handle the error
                                  // Check out our error handling guide: https://developers.facebook.com/docs/ios/errors/
                                  NSLog(@"%@",[NSString stringWithFormat:@"error %@", error.description]);
                              }
                          }];
    
    
    
}

- (void) makeRequestForUserData
{
    [FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        if (!error) {
            // Success! Include your code to handle the results here
            NSLog(@"%@",[NSString stringWithFormat:@"user info: %@", result]);
        } else {
            // An error occurred, we need to handle the error
            // Check out our error handling guide: https://developers.facebook.com/docs/ios/errors/
            NSLog(@"%@",[NSString stringWithFormat:@"error %@", error.description]);
        }
    }];
}


-(BOOL)shareFBCurrentSongTitle:(NSString *)title album:(NSString *)album artist:(NSString *)artist songDuretion:(NSString *)songduration {
      if([FBSession.activeSession isOpen])
      {
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   @"Sync Music App", @"name",title, @"caption",songduration, @"description",
                                   @"https://developer.ford.com/", @"link",
                                   @"http://www.brandsoftheworld.com/sites/default/files/styles/logo-thumbnail/public/0008/5841/brand.gif", @"picture",
                                   nil];
    
    [FBRequestConnection startWithGraphPath:@"/me/feed"
                                 parameters:params
                                 HTTPMethod:@"POST"
                          completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                              
                              if (!error) {
                                  NSLog(@"result: %@", result);
                              } else {
                                  NSLog(@"%@", error.description);
                              }
                          }
     ];

          return true;
          
      }else{
          
          return false;
      }

    return false;
}



- (void)facebookSessionStateChanged:(FBSession *)session state:(FBSessionState)state error:(NSError *)error
{
    switch (state) {
        case FBSessionStateOpen:
            // handle successful login here
        case FBSessionStateClosed:
        case FBSessionStateClosedLoginFailed:
            [FBSession.activeSession closeAndClearTokenInformation];
            
            if (error) {
                // handle error here, for example by showing an alert to the user
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Could not login with Facebook"
                                                                message:@"Facebook login failed. Please check your Facebook settings on your phone."
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
                [alert show];
            }
            break;
        default:
            break;
    }
}

@end
