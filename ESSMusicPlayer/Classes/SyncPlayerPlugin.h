//
//  SyncPlayerPlugin.h
//  SyncMusicPlayer
//
//  Created by Rahul Gupta on 22/10/13.
//  Copyright (c) 2013 Eastern Software System. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>


@interface SyncPlayerPlugin : UIViewController{
    
    float  volumeControl;
    
}
@property (strong, nonatomic) MPVolumeView * myViewVolume;
@property (readwrite, nonatomic) int currentSongIndex;
@property (strong, nonatomic) AVPlayer * player;
@property (strong, nonatomic)  AVPlayerItem * currentItem;

+ (SyncPlayerPlugin *)sharedMPInstance;
-(NSArray *)getMediaFilesList;
-(BOOL)playpauseSong;
-(BOOL)previousSong;
-(BOOL)nextSong;
-(BOOL)playTrackForIndex:(int)songIndex;
-(void)setValumeUP:(float)volume;
-(void)setValumeDOWN:(float)volume;
-(BOOL)pause;
-(BOOL)play;

@end
