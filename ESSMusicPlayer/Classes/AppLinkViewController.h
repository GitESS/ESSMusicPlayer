//
//  AppLinkViewController.h
//  ESSMusicPlayer
//
//  Created by Rahul Gupta on 10/22/13.
//  Copyright (c) 2013 ESSIndia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SyncPlayerPlugin.h"

@interface AppLinkViewController : UIViewController<AVAudioPlayerDelegate>{
    BOOL musicIsPlaying;
    BOOL trackCombination;
    int trackNumber;
    AVAudioPlayer *audioPlayer;
    
    NSMutableArray * trackArray;
    NSMutableArray * songTitles;
    NSMutableArray * songAlbum ;
    NSMutableArray * choiceSetIdList;
    int albumCount;
    int songCount;
    BOOL ifAlbum;
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
@end
