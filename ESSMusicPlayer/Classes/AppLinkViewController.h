//
//  AppLinkViewController.h
//  ESSMusicPlayer
//
//  Created by Rahul Gupta on 10/22/13.
//  Copyright (c) 2013 ESSIndia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SyncPlayerPlugin.h"
#import "AudioRecordShowViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import "GraphAPICallsViewController.h"

@interface AppLinkViewController : UIViewController<AVAudioPlayerDelegate,FBLoginViewDelegate>{
    BOOL musicIsPlaying;
    BOOL trackCombination;
    int trackNumber;
    AVAudioPlayer *audioPlayer;
    
    NSMutableArray * trackArray;
    NSMutableArray * songTitles;
    NSMutableArray * songAlbum;
    NSMutableArray * choiceSetIdList;
    int albumCount;
    int albumCountPrevious;
    int songCount;
    BOOL ifAlbum;
    GraphAPICallsViewController * gAPI;
}

- (void)NextSong;
- (void)PreviousSong;
- (void)softButtonAlbumAndSongList:(NSMutableArray *)tempArray;
- (void)softButtonAlbumAndSongListPrevious:(NSMutableArray *)tempArray;
- (NSString *)specialChar:(NSString *)message;
- (void)displayVehicleData:(NSNotification *)notify;
- (void)getVehicleData:(NSNotification *)notify;
- (void)UnsubscribeVehicleData:(NSNotification *)notify;
- (void)endAudioPassThruPressed;
- (void)setUpChoiceSetForAudioList : (NSMutableArray *)recordArray;
- (NSMutableArray *)recordArray;
- (NSString *)getFileName;
- (void)doConvertAudio:(NSString *)originalPath;
- (void)receiveAudioResponse:(NSNotification *)obj;
- (void)playRecoredAudio:(NSNotification *)notify;
- (IBAction)testRecord:(id)sender;
-(void)songAndAlbumArray;
@end
