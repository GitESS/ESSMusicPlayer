//
//  AudioRecordShowViewController.h
//  AppLinkTester2
//
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.
//
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreMedia/CoreMedia.h>


@interface AudioRecordShowViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    
    NSMutableArray *recordArray;
    
    UITableView *recordList;
    
    MPMoviePlayerViewController *_moviePlayerViewController;
}

@end
