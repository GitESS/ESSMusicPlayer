//
//  ViewController.h
//  ESSMusicPlayer
//
//  Created by Rahul Gupta on 10/21/13.
//  Copyright (c) 2013 ESSIndia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SyncPlayerPlugin.h"
#import  "AppLinkViewController.h"
#import "GraphAPICallsViewController.h"

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UIImageView * artWork;
    IBOutlet UILabel * songTitle;
    IBOutlet UILabel * artistName;
    IBOutlet UILabel * trackCompleted;
    IBOutlet UILabel * trackRemain;
    IBOutlet UILabel * volumePercentage;
    IBOutlet UIView * plyerView;
    IBOutlet UISlider * playbackProgress;
    
    NSMutableArray * trackArray;
    NSMutableArray * songTitles;
    NSMutableArray * songAlbum ;
}
-(IBAction)playNextTrack;
-(IBAction)playPreviousTrack;
-(IBAction)playPause;
-(IBAction)faceBookLogin:(id)sender;
-(IBAction)post:(id)sender;
@end
