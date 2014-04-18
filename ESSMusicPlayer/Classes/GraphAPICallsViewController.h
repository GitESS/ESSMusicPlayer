#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface GraphAPICallsViewController : UIViewController <FBLoginViewDelegate>
{
}
+ (GraphAPICallsViewController *)sharedInstance;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet FBProfilePictureView *profilePictureView;
@property (strong, nonatomic) IBOutlet FBLoginView *fbLoginView;
@property (strong, nonatomic) IBOutlet UIButton *requestUserInfoButton;
@property (strong, nonatomic) IBOutlet UIButton *requestObjectButton;
@property (strong, nonatomic) IBOutlet UIButton *postObjectButton;
@property (strong, nonatomic) IBOutlet UIButton *postOGStoryButton;
@property (strong, nonatomic) IBOutlet UIButton *deleteObjectButton;
@property (strong, nonatomic) NSString *objectID;
-(void)shareFBCurrentSongTitle:(NSString *)title
                         album:(NSString *)album
                        artist:(NSString *)artist
                  songDuretion:(NSString *)songduration ;
@end
