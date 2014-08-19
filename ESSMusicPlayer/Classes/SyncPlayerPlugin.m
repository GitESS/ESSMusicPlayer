//
//  SyncPlayerPlugin.m
//  SyncMusicPlayer
//
//  Created by Rahul Gupta on 22/10/13.
//  Copyright (c) 2013 Eastern Software System. All rights reserved.
//

#import "SyncPlayerPlugin.h"

@implementation SyncPlayerPlugin




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
            _currentSongIndex=-1;
            volumeControl=0.5;
            self.player = [[AVPlayer alloc] init];
       
        // Registers this class as the delegate of the audio session.
        [[AVAudioSession sharedInstance] setDelegate: self];
        NSError *setCategoryError = nil;
        [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error: &setCategoryError];
        if (setCategoryError) {
            NSLog(@"Error setting category! %@", [setCategoryError localizedDescription]);
        }
        
        UInt32 doSetProperty = 0;
        AudioSessionSetProperty (
                                 kAudioSessionProperty_OverrideCategoryMixWithOthers,
                                 sizeof (doSetProperty),
                                 &doSetProperty
                                 );
        
        NSError *activationError = nil;
        [[AVAudioSession sharedInstance] setActive: YES error: &activationError];
        if (activationError) {
            NSLog(@"Could not activate audio session. %@", [activationError localizedDescription]);
        }
    }
    
    return self;
}

static SyncPlayerPlugin *getInstance = NULL;
+ (SyncPlayerPlugin *)sharedMPInstance{
	@synchronized(self){
		if (getInstance == NULL)
			getInstance = [[self alloc] init];
	}
	return getInstance;
}

//  To fetch midia fils from phone lib / Get midea file name from resource folder for simulator

-(NSArray *)getMediaFilesList{
    
    #if TARGET_IPHONE_SIMULATOR
    NSMutableArray *arrayData = [[NSMutableArray alloc] init];
    [arrayData addObject:@"Again and again"];
    [arrayData addObject:@"Bandits in the Woods - Boston Strangler"];
   return arrayData;
    
    #else
    NSMutableArray *sortedSongs = [[NSMutableArray alloc] init];
    MPMediaQuery *albums = [MPMediaQuery albumsQuery];
    NSArray* albumObjects = [albums collections];
    for(MPMediaItemCollection *album in albumObjects) {
        for(MPMediaItem *song in album.items) {
            [sortedSongs addObject:song];
        }
    }
    return sortedSongs;
    
    #endif
}

// Play / Pause AUDIO file track
-(BOOL)playpauseSong{
    
    if([_player rate] !=0.0){
        [_player pause];
          return FALSE;
    }else{
        if (_currentSongIndex==-1) {
             [self playTrackForIndex:0];
        }else{
             [_player play];
        }
       
          return TRUE;
    }
  
}



//   Play AUDIO file track

-(BOOL)play{
    
    if([_player rate] == 0.0){
        
        if (_currentSongIndex==-1) {
            [self playTrackForIndex:0];
        }else{
            [_player play];
        }
    }
    return TRUE;
}


//  Pause AUDIO file track
-(BOOL)pause{
    
    if([_player rate] !=0.0){
        [_player pause];
    }
    return FALSE;
}


// Select  previous song
-(BOOL)previousSong{
    
    if(self.currentSongIndex - 1 >=0 ){
        self.currentSongIndex=self.currentSongIndex-1;
    }else{
        self.currentSongIndex=[[self getMediaFilesList] count] -1;
    }
    [self playTrackForIndex:self.currentSongIndex];
    return TRUE;
}



// Select Next song
-(BOOL)nextSong{
    if(self.currentSongIndex + 1 <[[self getMediaFilesList] count] ){
        self.currentSongIndex=self.currentSongIndex+1;
 
    }else{
        self.currentSongIndex=0;
    }
    [self playTrackForIndex:self.currentSongIndex];
    
    return TRUE;
}


//  Play Song for given track index
-(BOOL)playTrackForIndex:(int)songIndex{
    
    if(songIndex<[[self getMediaFilesList] count] ){
        self.currentSongIndex=songIndex;
        #if TARGET_IPHONE_SIMULATOR
          NSURL * url = [[NSBundle mainBundle] URLForResource:[[self getMediaFilesList] objectAtIndex:songIndex] withExtension:@"mp3"];
        
            NSLog(@"%@",url);
        
         self.currentItem = [AVPlayerItem playerItemWithURL:url];
     
        [self.player replaceCurrentItemWithPlayerItem:self.currentItem];
        [self.player play];
        
        #else
        
            MPMediaItem *song =[[self getMediaFilesList] objectAtIndex:songIndex];
         self.currentItem = [AVPlayerItem playerItemWithURL:[song valueForProperty:MPMediaItemPropertyAssetURL]];
            NSLog(@"%@",[song valueForProperty:MPMediaItemPropertyAssetURL]);
      
        [self.player replaceCurrentItemWithPlayerItem:self.currentItem];
        [self.player play];
        
        #endif
        
        return TRUE;
    }else{
        return FALSE;
    }
}

//  Play Song for given track index
-(void)playMediaFile:(NSString *)mediaFilePath{
        NSURL * url = [[NSBundle mainBundle] URLForResource:mediaFilePath withExtension:@"mp3"];
        
        NSLog(@"%@",url);
        
        self.currentItem = [AVPlayerItem playerItemWithURL:url];
        
        [self.player replaceCurrentItemWithPlayerItem:self.currentItem];
        [self.player play];
}

// Volume Increse
-(void)setValumeUP:(float)volume{
    
    NSLog(@"volumeControl:%f   volume:%f ",volumeControl,volume);
    if (volumeControl <= 1.0){
      
        volumeControl=volumeControl+volume;
        
        NSURL * url = [[NSBundle mainBundle] URLForResource:[[self getMediaFilesList] objectAtIndex:_currentSongIndex] withExtension:@"mp3"];
    
        AVURLAsset *asset = [AVURLAsset URLAssetWithURL:url options:nil];
        NSArray *audioTracks = [asset tracksWithMediaType:AVMediaTypeAudio];
    
        NSMutableArray *allAudioParams = [NSMutableArray array];
        
            for (AVAssetTrack *track in audioTracks) {
                    AVMutableAudioMixInputParameters *audioInputParams =[AVMutableAudioMixInputParameters audioMixInputParameters];
                    [audioInputParams setVolume:volumeControl atTime:kCMTimeZero];
                    [audioInputParams setTrackID:[track trackID]];
                    [allAudioParams addObject:audioInputParams];
                }
        AVMutableAudioMix *audioZeroMix = [AVMutableAudioMix audioMix];
        [audioZeroMix setInputParameters:allAudioParams];
    
        [[_player currentItem] setAudioMix:audioZeroMix];
    }
    
}

// For Volume Decrese
-(void)setValumeDOWN:(float)volume{
 
    if (volumeControl > 0.1){
         volumeControl=volumeControl-volume;
         NSURL * url = [[NSBundle mainBundle] URLForResource:[[self getMediaFilesList] objectAtIndex:_currentSongIndex] withExtension:@"mp3"];
    
         AVURLAsset *asset = [AVURLAsset URLAssetWithURL:url options:nil];
         NSArray *audioTracks = [asset tracksWithMediaType:AVMediaTypeAudio];
    
         NSMutableArray *allAudioParams = [NSMutableArray array];
         
                for (AVAssetTrack *track in audioTracks) {
                    AVMutableAudioMixInputParameters *audioInputParams =[AVMutableAudioMixInputParameters audioMixInputParameters];
                    [audioInputParams setVolume:volumeControl atTime:kCMTimeZero];
                    [audioInputParams setTrackID:[track trackID]];
                    [allAudioParams addObject:audioInputParams];
                }
         
         AVMutableAudioMix *audioZeroMix = [AVMutableAudioMix audioMix];
         [audioZeroMix setInputParameters:allAudioParams];
         [[_player currentItem] setAudioMix:audioZeroMix];

     }
}


@end
