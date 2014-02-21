//
//  ViewController.m
//  ESSMusicPlayer
//
//  Created by Rahul Gupta on 10/21/13.
//  Copyright (c) 2013 ESSIndia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *togglePlayPause;
@property (weak, nonatomic) IBOutlet UISlider *sliderOutlet;
@property (weak, nonatomic) IBOutlet UILabel *durationOutlet;
@property (strong, nonatomic) NSMutableArray *songsList;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) AVPlayer *audioPlayer;
@property (weak, nonatomic) IBOutlet UILabel *songName;

@property (weak, nonatomic) IBOutlet UIButton *connectWithSync;

- (IBAction)connectWithSync:(id)sender;

@end

@implementation ViewController


- (void)viewDidLoad{
    
    [super viewDidLoad];
    [self getMidiaList];
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(NavigateToSync:)
                                                name:@"HMIStatusForNavigate"
                                              object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playNextTrack)
                                                 name:AVPlayerItemDidPlayToEndTimeNotification
                                               object:[SyncPlayerPlugin sharedMPInstance].currentItem];


}


// navigate to Sync lock Screen
-(void)NavigateToSync:(NSNotification *)notify{
    
    if(![self.navigationController.visibleViewController isKindOfClass:[AppLinkViewController class]])
        [self performSegueWithIdentifier:@"segueToSync" sender:nil];
        
}

// fetch all music files
-(void)getMidiaList{
    
    if([[[SyncPlayerPlugin sharedMPInstance]    getMediaFilesList] count]){
        
        self.songsList =[NSMutableArray arrayWithArray:[[SyncPlayerPlugin sharedMPInstance]       getMediaFilesList]];
        
        [ [SyncPlayerPlugin sharedMPInstance]       playTrackForIndex:0];
        [self changeTableRowHilight];
        [NSTimer scheduledTimerWithTimeInterval:0.5
                                         target:self
                                       selector:@selector(playbackProgressBar:)
                                       userInfo:nil
                                        repeats:YES];
    }

    self.tableView.dataSource =self;
    self.tableView.delegate = self;
    [self.tableView reloadData];
    
    MPVolumeView * myViewVolume = [[MPVolumeView alloc] initWithFrame:CGRectMake(30, 38, 260, 50)];
    [myViewVolume sizeToFit];
    
    UISlider *volumeViewSlider;
    
    for (UIView *view in [myViewVolume subviews]){
        
        if ([[[view class] description] isEqualToString:@"MPVolumeSlider"]) {
            volumeViewSlider = (UISlider *)view;
        }
    }
    
    [volumeViewSlider setValue: 0.0f animated:YES];
    [plyerView addSubview:myViewVolume];
}


// button action for Track timer Slider
- (IBAction)sliderDragged:(id)sender {
    [self.audioPlayer seekToTime:CMTimeMakeWithSeconds((int)(self.sliderOutlet.value) , 1)];
}





-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
            return self.songsList.count;
}




-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"MusicCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    
    #if TARGET_IPHONE_SIMULATOR
    
    cell.textLabel.text = [self.songsList objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = @"";
    
    #else
            MPMediaItem *song = [self.songsList objectAtIndex:indexPath.row];

            cell.textLabel.text = [song valueForProperty: MPMediaItemPropertyTitle];
            cell.detailTextLabel.text = [song valueForProperty: MPMediaItemPropertyGenre];
            cell.imageView.image = [[song valueForProperty:MPMediaItemPropertyArtwork] imageWithSize:CGSizeMake(30, 30)];
            NSData *imageData = UIImagePNGRepresentation( cell.imageView.image );
    
            if(![imageData length]){
                    cell.imageView.image = [UIImage imageNamed:@"NoArtworkAvilable.png" ];
                }
    
    #endif
    
    return cell;
}

#pragma mark - TableView Delegate Methods

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    #if TARGET_IPHONE_SIMULATOR
        [ [SyncPlayerPlugin sharedMPInstance]       playTrackForIndex:indexPath.row];
    #else
        [SyncPlayerPlugin sharedMPInstance]      .currentSongIndex=indexPath.row;
        [[SyncPlayerPlugin sharedMPInstance]       playTrackForIndex:indexPath.row];
        [self changeTableRowHilight];
    #endif
    
}

// play/pause button's action method
-(IBAction)playPause{
    
    if([ [SyncPlayerPlugin sharedMPInstance]       playpauseSong]){
        
        [_togglePlayPause setImage:[UIImage imageNamed:@"pause_button.png"] forState:UIControlStateNormal];
        
    }else{
        
        [_togglePlayPause setImage:[UIImage imageNamed:@"play_button.png"] forState:UIControlStateNormal];
        
    }
}

// change the track to previous track number
-(IBAction)playPreviousTrack{
    
    [[SyncPlayerPlugin sharedMPInstance]  previousSong];
    [self changeTableRowHilight];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playNextTrack)
                                                 name:AVPlayerItemDidPlayToEndTimeNotification
                                               object:[SyncPlayerPlugin sharedMPInstance].currentItem];

}

// chanege  track to next track nember
-(IBAction)playNextTrack{
    
    [[SyncPlayerPlugin sharedMPInstance] nextSong];
    [self changeTableRowHilight];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playNextTrack)
                                                 name:AVPlayerItemDidPlayToEndTimeNotification
                                               object:[SyncPlayerPlugin sharedMPInstance].currentItem];

}

// highlight the row of song list to the current playing song
-(void)changeTableRowHilight{
    
    NSIndexPath * indexPath= [NSIndexPath indexPathForRow: [SyncPlayerPlugin sharedMPInstance]      .currentSongIndex inSection:0];
    [_tableView selectRowAtIndexPath:indexPath animated:NO  scrollPosition:UITableViewScrollPositionNone];
    [self updateViewOnSongChange];
  
}

- (void)didReceiveMemoryWarning{
    
    [super didReceiveMemoryWarning];
}

// update the Songtitle, Artist name, Artwork and play/pause button
-(void)updateViewOnSongChange{
    
    #if TARGET_IPHONE_SIMULATOR
        songTitle.text =[self.songsList objectAtIndex: [SyncPlayerPlugin sharedMPInstance].currentSongIndex];;
    #else
        MPMediaItem *song = [self.songsList objectAtIndex: [SyncPlayerPlugin sharedMPInstance].currentSongIndex];
        songTitle.text = [song valueForProperty: MPMediaItemPropertyTitle];
        artistName.text= [song valueForProperty: MPMediaItemPropertyArtist];
        artWork.image = [[song valueForProperty:MPMediaItemPropertyArtwork] imageWithSize:CGSizeMake(326, 187)];
        NSData *imageData = UIImagePNGRepresentation(artWork.image);
        if(![imageData length])
            artWork.image = [UIImage imageNamed:@"NoArtworkAvilableBigThumb.png" ];
    #endif
    
    if([[[SyncPlayerPlugin sharedMPInstance]   player] rate] !=0.0){
        [_togglePlayPause setImage:[UIImage imageNamed:@"pause_button.png"] forState:UIControlStateNormal];
    }else{
        [_togglePlayPause setImage:[UIImage imageNamed:@"play_button.png"] forState:UIControlStateNormal];
    }
    
}

// Method to change the state ot Track timer Slider value to song  current time and chnege the trackCompleted and trackRemaing Lable text
-(void)playbackProgressBar:(NSTimer*)timer{
    
    CMTime total= [SyncPlayerPlugin sharedMPInstance].player.currentItem.asset.duration;
    CMTime currentTime= [SyncPlayerPlugin sharedMPInstance].player.currentItem.currentTime;
    float totalSeconds = CMTimeGetSeconds(total);
    float currentTimeSeconds = CMTimeGetSeconds(currentTime);
    float f=currentTimeSeconds / totalSeconds;
    playbackProgress.value=f;
    trackCompleted.text=[NSString stringWithFormat:@"%.2f",currentTimeSeconds/ 60];
    trackRemain.text=[NSString stringWithFormat:@"%.2f",(currentTimeSeconds-totalSeconds)/ 60];
}

// Button action when user drag the slider position
- (IBAction)sliderValueChangedAction:(id)sender{
    
    CMTime total= [SyncPlayerPlugin sharedMPInstance]      .player.currentItem.asset.duration;
    float totalSeconds = CMTimeGetSeconds(total);
    float trackTime = [(UISlider *)sender value] * totalSeconds;
    CMTime seekingCM = CMTimeMake(trackTime, 1);
    [[SyncPlayerPlugin sharedMPInstance]      .player seekToTime:seekingCM];
    
}

// Change the view controler 
- (IBAction)connectWithSync:(id)sender{
    [self performSegueWithIdentifier:@"segueToSync" sender:nil];
}

@end
