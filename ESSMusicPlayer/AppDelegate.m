//
//  AppDelegate.m
//  ESSMusicPlayer
//
//  Created by Rahul Gupta on 10/21/13.
//  Copyright (c) 2013 ESSIndia. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [[SyncBrain sharedInstance] setupProxy];
    //[self fileList];
    
    
    CGSize iOSDeviceScreenSize = [[UIScreen mainScreen] bounds].size;
    
    if (iOSDeviceScreenSize.height == 480)
    {
        UIStoryboard *iPhone35Storyboard = [UIStoryboard storyboardWithName:@"Storyboard_3.5" bundle:nil];
        
        // Instantiate the initial view controller object from the storyboard
        UIViewController *initialViewController = [iPhone35Storyboard instantiateInitialViewController];
        
        // Instantiate a UIWindow object and initialize it with the screen size of the iOS device
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        
        // Set the initial view controller to be the root view controller of the window object
        self.window.rootViewController  = initialViewController;
        
        // Set the window object to be the key window and show it
        // [self.window makeKeyAndVisible];
        
    }
    return YES;
}
-(void)fileList
{
    NSString *bundlePathName = [[NSBundle mainBundle] bundlePath];
    NSString *dataPathName = [bundlePathName stringByAppendingPathComponent:@"Resource/Media"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:dataPathName]) {
        NSLog(@"%@ exists", dataPathName);
        BOOL isDir = NO;
        [fileManager fileExistsAtPath:dataPathName isDirectory:(&isDir)];
        if (isDir == YES) {
            NSLog(@"%@ is a directory", dataPathName);
            NSArray *contents;
            contents = [fileManager contentsOfDirectoryAtPath:dataPathName error:nil];
            for (NSString *entity in contents) {
                NSLog(@"%@ is within", entity);
            }
        } else {
            NSLog(@"%@ is not a directory", dataPathName);
        }
    } else {
        NSLog(@"%@ does not exist", dataPathName);
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
