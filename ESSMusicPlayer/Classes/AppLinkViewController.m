//
//  AppLinkViewController.m
//  ESSMusicPlayer
//
//  Created by Rahul Gupta on 10/22/13.
//  Copyright (c) 2013 ESSIndia. All rights reserved.
//

#import "AppLinkViewController.h"


@interface AppLinkViewController (){
    id syncBrain ;
    id notificationCenter;
    id syncPlayer;
}

-(void)buttonsEvent:(NSNotification *)notify;

-(void)displayConent :(NSString *)content1 withMessage2:(NSString *)msg2 withMessage3:(NSString *)msg3 withMessage4:(NSString *)msg4;

@property (strong, nonatomic) SyncPlayerPlugin * playerPlugin;
@end

@implementation AppLinkViewController

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    self.navigationController.navigationBar.hidden=YES;
    
    syncBrain = [SyncBrain sharedInstance];
    notificationCenter = [NSNotificationCenter defaultCenter];
    syncPlayer= [SyncPlayerPlugin sharedMPInstance];
    trackNumber=-1;
    //[[SyncBrain sharedInstance] initProperties];
    [self subcribeVoiceCommands];
    [self subcribeButton];
    [self addSubMenu];
    
    [notificationCenter addObserver:self
                           selector:@selector(buttonsEvent:)
                               name:@"musicPlay"
                             object:nil];
    [notificationCenter addObserver:self
                           selector:@selector(onVoiceCommand:)
                               name:@"onVoiceCommand"
                             object:nil];
    [notificationCenter addObserver:self
                           selector:@selector(NavigateToMusicPlayer)
                               name:@"HMIStatusForNavigateToMusicPlayer"
                             object:nil];
    [notificationCenter addObserver:self
                           selector:@selector(onChoice:)
                               name:@"onChoice"
                             object:nil];
    [notificationCenter addObserver:self
                           selector:@selector(NextSong)
                               name:AVPlayerItemDidPlayToEndTimeNotification
                             object:[(SyncPlayerPlugin *)syncPlayer currentItem]];
    
    [self metaCuntentOfCurrentPlayingSong];
    [self setUpChoiceSet];
    
}
-(void)setUpChoiceSet {
    
    choiceSetIdList = [[NSMutableArray alloc] init];
#if TARGET_IPHONE_SIMULATOR
    songTitles =[NSMutableArray arrayWithArray:[syncPlayer getMediaFilesList]];
#else
    songTitles=[[NSMutableArray alloc] init];
    trackArray=[[NSMutableArray alloc] init];
    songAlbum=[[NSMutableArray alloc] init];
    NSString * tempAlbumName =@"";
    for (int i=0; i<[[syncPlayer getMediaFilesList] count]; i++) {
        
        MPMediaItem *song = [[syncPlayer getMediaFilesList] objectAtIndex:i];
        [songTitles addObject:[song valueForProperty: MPMediaItemPropertyTitle]];
        [trackArray addObject:[NSString stringWithFormat:@"%@ %d",[song valueForProperty:MPMediaItemPropertyTitle],i]];
        
        if (![tempAlbumName isEqualToString:[song valueForProperty:MPMediaItemPropertyAlbumTitle]] ){
            tempAlbumName=[song valueForProperty:MPMediaItemPropertyAlbumTitle];
            [songAlbum addObject:[song valueForProperty: MPMediaItemPropertyAlbumTitle]];
        }
    }
    
#endif
    //Choice Set
    //Choices of Songs and Album
    NSMutableArray *choices = [[NSMutableArray alloc] init];
    int j=0;
    for (j = 0 ; j < [songTitles count]; j++) {
        FMCChoice *FMCc = [[FMCChoice alloc] init];
        FMCc.menuName = [self specialChar:[songTitles objectAtIndex:j]];
        FMCc.choiceID = [NSNumber numberWithInt: j];
        FMCc.vrCommands=[NSMutableArray arrayWithObjects:
                         [NSString stringWithFormat:@"Track %d", j],
                         nil];
        
        [choices addObject:FMCc];
    }
 /*   for ( int k = j ; k < (j+[songAlbum count]); k++) {
        FMCChoice *FMCc = [[FMCChoice alloc] init];
        FMCc.menuName = [self specialChar:[songAlbum objectAtIndex:k-j]];
        FMCc.choiceID = [NSNumber numberWithInt: k];
        FMCc.vrCommands=[NSMutableArray arrayWithObjects:[NSString stringWithFormat:@"%@",[self specialChar:[songAlbum objectAtIndex:k-j] ]] , nil];
        [choices addObject:FMCc];
    }
    */
    NSNumber * CSID=[[NSNumber alloc] initWithInt:CHID_INTRACTION];
    [syncBrain createInteractionChoiceSetPressedWithID:CSID choiceSet:choices];
}


-(NSString *)specialChar:(NSString *)message{
    
    NSString *resultString;
    if (message !=nil ) {
        
        if (!([message isEqualToString:@""])) {
            
            NSCharacterSet *notAllowedChars = [[NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"] invertedSet];
            resultString = [[message componentsSeparatedByCharactersInSet:notAllowedChars] componentsJoinedByString:@""];
        }else{
            resultString=@"";
        }
    }else{
        resultString=@"";
    }
    return resultString;
}
-(void)NavigateToMusicPlayer{
    self.navigationController.navigationBar.hidden=FALSE;
    [self.navigationController popViewControllerAnimated:YES];
}


// adding All Voice Command
-(void)subcribeVoiceCommands{
    [syncBrain addCommand:VR_SELECT_SONG];
    [syncBrain addCommand:VR_RESUME_SONG];
    [syncBrain addCommand:VR_STOP_PLAYING];
    [syncBrain addCommand:VR_NEXT];
    [syncBrain addCommand:VR_PREVIOUS];
    [syncBrain addCommand:VR_FORWARD];
    [syncBrain addCommand:VR_BACKWARD];
}

//Add submenu
- (void)addSubMenu{
    [syncBrain addSubMenuPressedwithID:[NSNumber numberWithInt:SUBMENUID]
                              menuName:@"Info"
                              position:[NSNumber numberWithDouble:round(1)]];
    [syncBrain addAdvancedCommandPressedwithMenuName:@"Application"
                                            position:[NSNumber numberWithInt:1]
                                            parentID:[NSNumber numberWithInt:SUBMENUID]
                                          vrCommands:nil
                                           iconValue:@"0B"
                                            iconType:[FMCImageType DYNAMIC]];
    [syncBrain addAdvancedCommandPressedwithMenuName:@"Applink"
                                            position:[NSNumber numberWithInt:1]
                                            parentID:[NSNumber numberWithInt:SUBMENUID]
                                          vrCommands:nil
                                           iconValue:@"0B"
                                            iconType:[FMCImageType  STATIC]];
    [syncBrain addAdvancedCommandPressedwithMenuName:@"Application Feature"
                                            position:[NSNumber numberWithInt:1]
                                            parentID:[NSNumber numberWithInt:SUBMENUID]
                                          vrCommands:nil
                                           iconValue:@"0B"
                                            iconType:[FMCImageType STATIC]];
}

// suscribe all required buttons
- (void)subcribeButton{
    [syncBrain subscribeButtonPressed:[FMCButtonName OK]];
    [syncBrain subscribeButtonPressed:[FMCButtonName SEEKLEFT]];
    [syncBrain subscribeButtonPressed:[FMCButtonName SEEKRIGHT]];
    [syncBrain subscribeButtonPressed:[FMCButtonName TUNEUP]];
    [syncBrain subscribeButtonPressed:[FMCButtonName TUNEDOWN]];
    [syncBrain subscribeButtonPressed:[FMCButtonName PRESET_0]];
    [syncBrain subscribeButtonPressed:[FMCButtonName PRESET_1]];
    [syncBrain subscribeButtonPressed:[FMCButtonName PRESET_2]];
    [syncBrain subscribeButtonPressed:[FMCButtonName PRESET_3]];
    [syncBrain subscribeButtonPressed:[FMCButtonName PRESET_4]];
    [syncBrain subscribeButtonPressed:[FMCButtonName PRESET_5]];
    [syncBrain subscribeButtonPressed:[FMCButtonName PRESET_6]];
    [syncBrain subscribeButtonPressed:[FMCButtonName PRESET_7]];
    [syncBrain subscribeButtonPressed:[FMCButtonName PRESET_8]];
    [syncBrain subscribeButtonPressed:[FMCButtonName PRESET_9]];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidUnload{
    [syncBrain onProxyClosed];
}


// For all button Events
-(void)buttonsEvent:(NSNotification *)notify {
    
    FMCOnButtonPress *buttonPress = [notify object];
    
    if ([buttonPress.buttonName.value isEqualToString:ESS_OK]) {
        if([syncPlayer  playpauseSong]){
            [self metaCuntentOfCurrentPlayingSong];
        }
        else{
#if TARGET_IPHONE_SIMULATOR
            [syncBrain showPressed:[[syncPlayer  getMediaFilesList] objectAtIndex:[(SyncPlayerPlugin *)syncPlayer currentSongIndex]] WithSubMessage:@"Pause"];
#else
            MPMediaItem *song = [[syncPlayer  getMediaFilesList] objectAtIndex:[syncPlayer   currentSongIndex]];
            NSString *songTitle = [song valueForProperty: MPMediaItemPropertyTitle];
            [syncBrain showPressed:songTitle WithSubMessage:@"Pause"];
#endif
        }
    }
    if ([buttonPress.buttonName.value isEqualToString:ESS_SEEKLEFT]){
        [self PreviousSong];
    }
    if ([buttonPress.buttonName.value isEqualToString:ESS_SEEKRIGHT]){
        [self NextSong];
    }
    if ([buttonPress.buttonName.value isEqualToString:ESS_TUNEUP]){
        [syncPlayer setValumeUP:0.1];
    }
    if ([buttonPress.buttonName.value isEqualToString:ESS_TUNEDOWN]){
        [syncPlayer setValumeDOWN:0.1];
    }
    if ([buttonPress.buttonName.value isEqualToString:ESS_PRESET_0]){
        [self playTrackNumber:0];
    }
    if ([buttonPress.buttonName.value isEqualToString:ESS_PRESET_1]){
        [self playTrackNumber:1];
    }
    if ([buttonPress.buttonName.value isEqualToString:ESS_PRESET_2]){
        [self playTrackNumber:2];
    }
    if ([buttonPress.buttonName.value isEqualToString:ESS_PRESET_3]){
        [self playTrackNumber:3];
    }
    if ([buttonPress.buttonName.value isEqualToString:ESS_PRESET_4]){
        [self playTrackNumber:4];
    }
    if ([buttonPress.buttonName.value isEqualToString:ESS_PRESET_5]){
        [self playTrackNumber:5];
    }
    if ([buttonPress.buttonName.value isEqualToString:ESS_PRESET_6]){
        [self playTrackNumber:6];
    }
    if ([buttonPress.buttonName.value isEqualToString:ESS_PRESET_7]){
        [self playTrackNumber:7];
    }
    if ([buttonPress.buttonName.value isEqualToString:ESS_PRESET_8]){
        [self playTrackNumber:8];
    }
    if ([buttonPress.buttonName.value isEqualToString:ESS_PRESET_9]){
        [self playTrackNumber:9];
    }
    
    if ([buttonPress.customButtonID intValue] == 5001) {
        albumCount=0;
        ifAlbum=TRUE;
        [self softButtonAlbumAndSongList:songAlbum];
    }
    if ([buttonPress.customButtonID intValue] == 5002) {
          ifAlbum=FALSE;
        [self softButtonAlbumAndSongList:songTitles];
    }
    if ([buttonPress.customButtonID intValue] == 5003) {
        [self softButtonSongInfo];
    }
    if ([buttonPress.customButtonID intValue] == 5004) {
        [self vehicleData];
        
    }
    if ([buttonPress.customButtonID intValue] == 5005) {
        
        [self voiceRecorder];
        
    }
    if ([buttonPress.customButtonID intValue] == 5006) {
        [self softButtonAppfeatureInfo];
    }
    if ([buttonPress.customButtonID intValue] == 5007) {
        
        [self softButtonApplicationInfo];
    }
    if ([buttonPress.customButtonID intValue] == 5008) {
        [self softButtonApplinkInfo];
    }
    
    
    //Sub SoftButton message Functionality(Next,Previous and Back in Album and Song List).
    if ([buttonPress.customButtonID intValue] == 1001) {
        if (ifAlbum) {
            
            [self softButtonAlbumAndSongListPrevious:songAlbum];
        }else{
            
            [self softButtonAlbumAndSongListPrevious:songTitles];
        }
    }
    if ([buttonPress.customButtonID intValue] == 1002) {
        if (ifAlbum) {
            
            [self softButtonAlbumAndSongList:songAlbum];
        }else{
            
            [self softButtonAlbumAndSongList:songTitles];
        }
    }
    if ([buttonPress.customButtonID intValue] == 1003) {
        MPMediaItem *song = [[syncPlayer getMediaFilesList] objectAtIndex:[syncPlayer currentSongIndex]];
        NSString *songTitle = [song valueForProperty: MPMediaItemPropertyTitle];
        
        [syncBrain showPressed:songTitle WithSubMessage:@"Playing"];
    }
    
    //Close option in scrollable message if found custom Button ID of close softbutton in scrollable message
    if ([buttonPress.customButtonID intValue] == 3001) {
        
        
    }

    
}

//SoftButton Functionality


-(void)softButtonAlbumAndSongList:(NSMutableArray *)tempArray{
    
    int songcount= [tempArray count];
    int countDiffrent= (albumCount-songcount);
    if (countDiffrent<0) {
        countDiffrent=countDiffrent*(-1);
    }
    
    NSLog(@"Next albumCount : %d",albumCount);
    
    if (albumCount<=songcount) {
        if (countDiffrent>=4) {
            [syncBrain showPressed2:[tempArray objectAtIndex:albumCount]
             message2:[tempArray objectAtIndex:albumCount+1]
             message3:[tempArray objectAtIndex:albumCount+2]
             message4:[tempArray objectAtIndex:albumCount+3]
             count:4];
             
            albumCount=albumCount+4;
        }else  if (countDiffrent==3)
        {
            [syncBrain showPressed2:[tempArray objectAtIndex:albumCount]
             message2:[tempArray objectAtIndex:albumCount+1]
             message3:[tempArray objectAtIndex:albumCount+2]
             message4:nil
             count:3];
             
            albumCount=albumCount+3;
            
        }else  if (countDiffrent==2)
        {
            [syncBrain showPressed2:[tempArray objectAtIndex:albumCount]
             message2:[tempArray objectAtIndex:albumCount+1]
             message3:nil
             message4:nil
             count:2];
             
            albumCount=albumCount+2;
            
        }else  if (countDiffrent==1)
        {
            [syncBrain showPressed2:[tempArray objectAtIndex:albumCount]
             message2:nil
             message3:nil
             message4:nil
             count:1];
             
            albumCount=albumCount+1;
            
        }
        
    }
}

-(void)softButtonAlbumAndSongListPrevious:(NSMutableArray *)tempArray{
    
    int songcount= (int)[tempArray count];
    int countDiffrent= (albumCount-songcount);
    if (countDiffrent<0) {
        countDiffrent=countDiffrent*(-1);
    }
    
    //[syncBrain alert:[NSString stringWithFormat:@"albumCount : %d",albumCount]];
    
    if (albumCount>0) {
        if (albumCount>=4) {
            [syncBrain showPressed2:[tempArray objectAtIndex:albumCount-1]
             message2:[tempArray objectAtIndex:albumCount-2]
             message3:[tempArray objectAtIndex:albumCount-3]
             message4:[tempArray objectAtIndex:albumCount-4]
                count:4];
            albumCount=albumCount-4;
        }else  if (albumCount==3)
        {
            [syncBrain showPressed2:[tempArray objectAtIndex:albumCount]
             message2:[tempArray objectAtIndex:albumCount-1]
             message3:[tempArray objectAtIndex:albumCount-2]
             message4:nil
                count:3];
            albumCount=albumCount-3;
            
        }else  if (albumCount==2)
        {
            [syncBrain showPressed2:[tempArray objectAtIndex:albumCount]
             message2:[tempArray objectAtIndex:albumCount-1]
             message3:nil
             message4:nil
                count:2];
            albumCount=albumCount-2;
            
        }else  if (albumCount==1)
        {
            [syncBrain showPressed2:[tempArray objectAtIndex:albumCount]
             message2:nil
             message3:nil
             message4:nil
                count:1];
            albumCount=albumCount-1;
            
        }
        
    }
    
}


-(void)softButtonSongInfo{
    MPMediaItem *song = [[syncPlayer  getMediaFilesList] objectAtIndex:[syncPlayer   currentSongIndex]];
    [syncBrain showPressed:[song valueForProperty: MPMediaItemPropertyTitle]
                  message2:[song valueForProperty: MPMediaItemPropertyAlbumTitle]
                  message3:[song valueForProperty: MPMediaItemPropertyArtist]
                  message4:[song valueForProperty: MPMediaItemPropertyLyrics]];
    
}
//Vehicle Data
- (void)vehicleData{
    [syncBrain  subscribeVehicalData];
    
}

//AudioPassthrough

- (void)voiceRecorder{
    
    
}

//Scrollable Message
-(void)softButtonApplicationInfo{
    //
    [syncBrain scrollableMessagePressedWithScrollableMessageBody:@"It is a Music player appliction,\
     which is applink enabled, We can handle songs through SYNC." timeOut:[NSNumber numberWithInt:10] softButtons:nil];
}

//Scrollable Message
-(void)softButtonApplinkInfo{
    [syncBrain scrollableMessagePressedWithScrollableMessageBody:@"AppLink enabled applications \
     shall communicate with SYNC over a known transport layer" timeOut:[NSNumber numberWithInt:10] softButtons:nil];
    
}

//Scrollable Message
-(void)softButtonAppfeatureInfo{
    
    NSString *feature = @"Application features. When this app is connected with SYNC a lock screen will apear then you can handle app threough SYNC only. For play and pause use ok button Or speek, stop playing. For previous and next song seek previous and seek next button used  Or speek, previous next. For select a random song use numeric keys combination Or speek, select song when sync ask for choice speek song title or say track with number or album name";
    
    [syncBrain scrollableMessagePressedWithScrollableMessageBody:feature timeOut:[NSNumber numberWithInt:10] softButtons:nil];
}
//SoftButton End Functionality


// For playing a particular Track number
-(void)playTrackNumber:(int)index{
    
    if (trackNumber>=0){
        trackNumber=(trackNumber * 10)+index;
    }else{
        trackNumber=index;
    }
    //[self displayConent:[NSString stringWithFormat:@"Track :%d",trackNumber] withMessage2:@"" withMessage3:@"" withMessage4:@""] ;
    [syncBrain showPressed:[NSString stringWithFormat:@"Track :%d",trackNumber] WithSubMessage:@""];
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(playFinalTrack) object:nil];
    [self performSelector:@selector(playFinalTrack) withObject:Nil afterDelay:2.5 ];
    
}

-(void)displayConent :(NSString *)content1 withMessage2:(NSString *)msg2 withMessage3:(NSString *)msg3 withMessage4:(NSString *)msg4{
    
    NSMutableArray *medialist =[[NSMutableArray alloc]initWithArray:[syncPlayer getMediaFilesList] ];
    NSLog(@"%@",medialist);
    
}

-(void)playFinalTrack{
    
    if(![syncPlayer playTrackForIndex:trackNumber]){
        //[self displayConent:@"Track Not Found" withMessage2:@"" withMessage3:@"" withMessage4:@""] ;
        
        [syncBrain showPressed:@"Track not Found" WithSubMessage:@""];
        [self performSelector:@selector(metaCuntentOfCurrentPlayingSong) withObject:self afterDelay:2.0 ];
        
    }else{
        
#if TARGET_IPHONE_SIMULATOR
        [syncBrain showPressed:[[syncPlayer  getMediaFilesList] objectAtIndex:[(SyncPlayerPlugin *)syncPlayer currentSongIndex]] WithSubMessage:@"Playing"];
        //[self displayConent:[[syncPlayer  getMediaFilesList] objectAtIndex:[(SyncPlayerPlugin *)syncPlayer currentSongIndex]] withMessage2:@"Playing" withMessage3:@"" withMessage4:@""] ;
        
#else
        MPMediaItem *song = [[syncPlayer getMediaFilesList] objectAtIndex:[syncPlayer currentSongIndex]];
        NSString *songTitle = [song valueForProperty: MPMediaItemPropertyTitle];
        //[self displayConent:songTitle withMessage2:@"Playing" withMessage3:@"" withMessage4:@""] ;
        [syncBrain showPressed:songTitle WithSubMessage:@"Playing"];
#endif
    }
    trackNumber=-1;
}

// Show the Song Title and Playing Status
-(void)metaCuntentOfCurrentPlayingSong{
    
#if TARGET_IPHONE_SIMULATOR
    //[self displayConent:[[syncPlayer getMediaFilesList] objectAtIndex:[(SyncPlayerPlugin *)syncPlayer currentSongIndex]] withMessage2:@"Playing" withMessage3:@"" withMessage4:@""] ;
    [syncBrain showPressed:[[syncPlayer getMediaFilesList] objectAtIndex:[(SyncPlayerPlugin *)syncPlayer currentSongIndex]] WithSubMessage:@"Playing"];
#else
    MPMediaItem *song = [[syncPlayer  getMediaFilesList] objectAtIndex:[syncPlayer   currentSongIndex]];
    NSString *songTitle = [song valueForProperty:MPMediaItemPropertyTitle];
    [syncBrain showPressed:songTitle WithSubMessage:@"Playing"];
    //[self displayConent:songTitle withMessage2:@"Playing" withMessage3:@"" withMessage4:@""] ;
#endif
    
    
}

-(void)showTimer:(NSString *)status{
    
    CMTime trackDuration=[(SyncPlayerPlugin *)syncPlayer player].currentItem.asset.duration;
    CMTime currentTime=[(SyncPlayerPlugin *)syncPlayer player].currentItem.currentTime;
    NSUInteger TotalSeconds = CMTimeGetSeconds(trackDuration);
    float currentTimeSeconds = CMTimeGetSeconds(currentTime);
    NSUInteger Hours = floor(TotalSeconds / 3600);
    NSUInteger Minutes = floor(TotalSeconds % 3600 / 60);
    NSUInteger Seconds = floor(TotalSeconds % 3600 % 60);
    if([status isEqualToString:@"Pause"]){
        [syncBrain  setMediaClockTimerPressedwithHours:[NSNumber numberWithInt:(int)Hours]
                                               minutes:[NSNumber numberWithInt:(int)Minutes]
                                               seconds:[NSNumber numberWithInt:(int)Seconds]
                                            updateMode:[FMCUpdateMode PAUSE]];
        
    }else if([status isEqualToString:@"play"]){
        
        if (currentTimeSeconds==0.0) {
            [syncBrain setMediaClockTimerPressedwithHours:[NSNumber numberWithInt:(int)Hours]
                                                  minutes:[NSNumber numberWithInt:(int)Minutes]
                                                  seconds:[NSNumber numberWithInt:(int)Seconds]
                                               updateMode:[FMCUpdateMode COUNTDOWN]];
        }
        
    }else if([status isEqualToString:@"RESUME"]){
        [syncBrain setMediaClockTimerPressedwithHours:[NSNumber numberWithInt:(int)Hours]
                                              minutes:[NSNumber numberWithInt:(int)Minutes]
                                              seconds:[NSNumber numberWithInt:(int)Seconds]
                                           updateMode:[FMCUpdateMode RESUME]];
        
    }
}

-(void)onVoiceCommand:(NSNotification *)notify{
    
    FMCOnCommand *notification = [notify object];
    //[syncBrain alert:[NSString stringWithFormat:@"CVR_SELECT_SONG!!! %d ",[notification.cmdID intValue]]];
    if ([notification.cmdID intValue] >([[(SyncBrain *)syncBrain allVoiceCommand] count]-1)) {
        int subMenuIndex=[notification.cmdID intValue] -([[(SyncBrain *)syncBrain allVoiceCommand] count]-1);
        [self selectTTSwithIndex:subMenuIndex];
    }else{
        
        NSString * cmdText=  [[(SyncBrain *)syncBrain allVoiceCommand] objectForKey:[NSString stringWithFormat:@"%@",notification.cmdID]];
        //[syncBrain alert:[NSString stringWithFormat:@"Voice Command : %@ ",cmdText]];
        if([cmdText isEqualToString:VR_STOP_PLAYING]){
            [(SyncPlayerPlugin *)syncPlayer pause];
            
#if TARGET_IPHONE_SIMULATOR
            [syncBrain showPressed:[[syncPlayer  getMediaFilesList]
                                    objectAtIndex:[(SyncPlayerPlugin *)syncPlayer currentSongIndex]]
                    WithSubMessage:@"Pause"];
#else
            MPMediaItem *song =
            [[syncPlayer  getMediaFilesList] objectAtIndex:[syncPlayer   currentSongIndex]];
            NSString *songTitle = [song valueForProperty: MPMediaItemPropertyTitle];
            [self displayConent:songTitle withMessage2:@"Pause" withMessage3:@"" withMessage4:@""] ;
            //[syncBrain showPressed:songTitle WithSubMessage:@"Pause"];
#endif
            
        }else if([cmdText isEqualToString:VR_SELECT_SONG]){
             // [syncBrain alert:@"CVR_SELECT_SONG!!!"];
           [self setupChoiceSetIntractionPerformer:@"Please Say, Song title, or, Song Track number, or, Album Name"
                                        initialText:@"Select Song."
                                           helpText:@"you can selct any song by saying it's title, or, Track number, or, Album Name"
                                        timeoutText:@"try again Later"
                                           choiceID:CHID_INTRACTION];
        }else if([cmdText isEqualToString:VR_RESUME_SONG]){
            [(SyncPlayerPlugin *)syncPlayer play];
            [self metaCuntentOfCurrentPlayingSong];
        }else  if([cmdText isEqualToString:VR_NEXT]){
            [self NextSong];
        }else  if([cmdText isEqualToString:VR_PREVIOUS]){
            [self PreviousSong];
        }else  if([cmdText isEqualToString:VR_FORWARD]){
            [self  forword];
        }else  if([cmdText isEqualToString:VR_BACKWARD]){
            [self backword];
        }
        
    }
    
}

-(void)onChoice:(NSNotification *)notify{
    
    FMCPerformInteractionResponse *notification = [notify object];
   // [syncBrain alert:[NSString stringWithFormat:@"on Voice Command %d",[notification.choiceID intValue]]];
    
    NSArray * medialist=[syncPlayer getMediaFilesList];
    
    if ([notification.choiceID intValue]>=[medialist count]){
        [self getAlbumFirstSong:(int)([notification.choiceID intValue]-[medialist count] )];
    }else{
        [syncPlayer playTrackForIndex:[notification.choiceID intValue]];
        [self metaCuntentOfCurrentPlayingSong];
    }
}

-(void)getAlbumFirstSong:(int)albumIndex{
    
    NSString * tempAlbumName=[songAlbum objectAtIndex:albumIndex];
    NSArray * medialist=[syncPlayer getMediaFilesList];
    
    for(int i=0; i<[medialist count]; i++) {
        MPMediaItem *song = [medialist objectAtIndex:i];
        [songTitles addObject:[song valueForProperty: MPMediaItemPropertyTitle]];
        NSString * songTitle=[song valueForProperty: MPMediaItemPropertyTitle];
        [trackArray addObject:[NSString stringWithFormat:@"%@ %d",songTitle,i]];
        if ([tempAlbumName isEqualToString:songTitle] ){
            [syncPlayer playTrackForIndex:i];
            [self metaCuntentOfCurrentPlayingSong];
            break;
        }
    }
    
}

-(void)NextSong{
    if([syncPlayer  nextSong]){
        [self metaCuntentOfCurrentPlayingSong];
    }else{
        [syncBrain showPressed:@"Track not Found"
                WithSubMessage:@""];
        
        [self performSelector:@selector(metaCuntentOfCurrentPlayingSong)
                   withObject:self
                   afterDelay:2.0 ];
    }
    
    [notificationCenter addObserver:self
                           selector:@selector(NextSong)
                               name:AVPlayerItemDidPlayToEndTimeNotification
                             object:[(SyncPlayerPlugin *)syncPlayer currentItem]];
    trackNumber=-1;
}

-(void)PreviousSong{
    if([syncPlayer  previousSong]){
        [self metaCuntentOfCurrentPlayingSong];
    }else{
        [syncBrain showPressed:@"Track not Found" WithSubMessage:@""];
        
        [self performSelector:@selector(metaCuntentOfCurrentPlayingSong)
                   withObject:self
                   afterDelay:2.0 ];
    }
    [notificationCenter addObserver:self
                           selector:@selector(NextSong)
                               name:AVPlayerItemDidPlayToEndTimeNotification
                             object:[(SyncPlayerPlugin *)syncPlayer currentItem]];
    trackNumber=-1;
}

-(void)setupChoiceSetIntractionPerformer:(NSString *)initPrompt
                             initialText:(NSString *)initialText
                                helpText:(NSString *)helpText
                             timeoutText:(NSString *)timeoutText
                                choiceID:(int)choiceID{
    
   // [syncBrain alert:@"Choice Set !!!"];
    NSArray *tempPrompt = [initPrompt componentsSeparatedByString:@", "];
    NSMutableArray *initialPrompt = [[NSMutableArray alloc] init];
    for (int i = 0; i < [tempPrompt count]; i++) {
        [initialPrompt addObject:[FMCTTSChunkFactory buildTTSChunkForString:[tempPrompt objectAtIndex:i]
                                                                       type:[FMCSpeechCapabilities TEXT]]];
    }
     // [syncBrain alert:@"tempPrompt !!!"];
    NSArray *tempHelp = [helpText  componentsSeparatedByString:@", "];
    NSMutableArray *helpChunks = [[NSMutableArray alloc] init];
    for (int i = 0; i < [tempHelp count]; i++) {
        [helpChunks addObject:[FMCTTSChunkFactory buildTTSChunkForString:[tempHelp objectAtIndex:i]
                                                                    type:[FMCSpeechCapabilities TEXT]]];
    }
    //[syncBrain alert:@"Help !!!"];
    NSArray *tempTimeout = [timeoutText componentsSeparatedByString:@", "];
    NSMutableArray *timeoutChunks = [[NSMutableArray alloc] init];
    for (int i = 0; i < [tempTimeout count]; i++) {
        [timeoutChunks addObject:[FMCTTSChunkFactory buildTTSChunkForString:[tempTimeout objectAtIndex:i]
                                                                       type:[FMCSpeechCapabilities TEXT]]];
    }
    //[syncBrain alert:@"tempTimeout !!!"];
    FMCInteractionMode *im= [FMCInteractionMode VR_ONLY];
    float  timeout=10.000000;
    NSArray * choiceArray =[NSArray arrayWithObject:[NSNumber numberWithInt:choiceID] ];
    
    NSNumber * timeOut =[NSNumber numberWithDouble:(round(timeout)*1000)];
    
    //[syncBrain alert:@"NSArray !!!"];
    [syncBrain  performInteractionPressedwithInitialPrompt:initialPrompt
                                               initialText:initialText
                                interactionChoiceSetIDList:choiceArray
                                                helpChunks:helpChunks
                                             timeoutChunks:timeoutChunks
                                           interactionMode:im
                                                   timeout:timeOut
                                                    vrHelp:helpChunks];
    
}

- (void)selectTTSwithIndex:(int)subMenue{
    if (subMenue==1) {
        [syncBrain speakStringUsingTTS:@"It is a Music player appliction,\
         which is applink enabled, We can handle songs through SYNC."];
    }else  if (subMenue ==2) {
        [syncBrain speakStringUsingTTS:@"AppLink enabled applications \
         shall communicate with SYNC over a known transport layer"];
    }else  if (subMenue ==3) {
        NSMutableArray * featureChunkArray =[[NSMutableArray alloc] init];
        [featureChunkArray addObject:@"application features"];
        [featureChunkArray addObject:@"when this app is connected with SYNC,"];
        [featureChunkArray addObject:@"A lock screen will apear,"];
        [featureChunkArray addObject:@"then you can handle app threough SYNC only,"];
        [featureChunkArray addObject:@"for play and pause use ok button,"];
        [featureChunkArray addObject:@"Or speek, stop playing," ];
        [featureChunkArray addObject:@"for previous and next song seek previous and seek next button used,"];
        [featureChunkArray addObject:@"Or speek, previous next,"];
        [featureChunkArray addObject:@"for select a random song use numeric keys combination,"];
        [featureChunkArray addObject:@"Or speek, select song,"];
        [featureChunkArray addObject:@"when sync ask for choice,"];
        [featureChunkArray addObject:@"speek song title,"];
        [featureChunkArray addObject:@"or say track with number or album name,"];
        [syncBrain speakStringUsingTTSChunks:featureChunkArray];
    }
}

-(void)forword{
    CMTime currentTime= [syncPlayer player].currentItem.currentTime;
    float totalSeconds = CMTimeGetSeconds(currentTime);
    float trackTime =totalSeconds + 30.00;
    CMTime seekingCM = CMTimeMake(trackTime, 1);
    [[syncPlayer player] seekToTime:seekingCM];
    
}

-(void)backword{
    CMTime currentTime= [syncPlayer player].currentItem.currentTime;
    float totalSeconds = CMTimeGetSeconds(currentTime);
    float trackTime = totalSeconds - 30.00;
    CMTime seekingCM = CMTimeMake(trackTime, 1);
    [[syncPlayer player] seekToTime:seekingCM];
    
}



//    NSArray * allComandKeys= [[(SyncBrain *)syncBrain allVoiceCommand] allKeys];
-(IBAction)deleteAndUnsubscribe:(id)sender{
    //Delete Command from Sync
    /*
     [syncBrain deleteCommandPressed:[NSNumber numberWithInt:(int)[NSString stringWithFormat:@"%@",(NSString *)[[(SyncBrain *)syncBrain allVoiceCommand] objectForKey:VR_SELECT_SONG]]]];
     [syncBrain deleteCommandPressed:[NSNumber numberWithInt:(int)[NSString stringWithFormat:@"%@",(NSString *)[[(SyncBrain *)syncBrain allVoiceCommand] objectForKey:VR_RESUME_SONG]]]];
     [syncBrain deleteCommandPressed:[NSNumber numberWithInt:(int)[NSString stringWithFormat:@"%@",(NSString *)[[(SyncBrain *)syncBrain allVoiceCommand] objectForKey:VR_NEXT]]]];
     [syncBrain deleteCommandPressed:[NSNumber numberWithInt:(int)[NSString stringWithFormat:@"%@",(NSString *)[[(SyncBrain *)syncBrain allVoiceCommand] objectForKey:VR_PREVIOUS]]]];
     [syncBrain deleteCommandPressed:[NSNumber numberWithInt:(int)[NSString stringWithFormat:@"%@",(NSString *)[[(SyncBrain *)syncBrain allVoiceCommand] objectForKey:SUBMENU_OPTION_APPLICATION]]]];
     [syncBrain deleteCommandPressed:[NSNumber numberWithInt:(int)[NSString stringWithFormat:@"%@",(NSString *)[[(SyncBrain *)syncBrain allVoiceCommand] objectForKey:SUBMENU_OPTION_APPLINK]]]];
     [syncBrain deleteCommandPressed:[NSNumber numberWithInt:(int)[NSString stringWithFormat:@"%@",(NSString *)[[(SyncBrain *)syncBrain allVoiceCommand] objectForKey:SUBMENU_OPTION_APPLICATION_FEATURE]]]];
     */
    //Unsubscribe button
    [syncBrain unsubscribeButtonPressed:[FMCButtonName OK]];
    [syncBrain unsubscribeButtonPressed:[FMCButtonName SEEKLEFT]];
    [syncBrain unsubscribeButtonPressed:[FMCButtonName SEEKRIGHT]];
    [syncBrain unsubscribeButtonPressed:[FMCButtonName TUNEUP]];
    [syncBrain unsubscribeButtonPressed:[FMCButtonName TUNEDOWN]];
    [syncBrain unsubscribeButtonPressed:[FMCButtonName PRESET_0]];
    [syncBrain unsubscribeButtonPressed:[FMCButtonName PRESET_1]];
    [syncBrain unsubscribeButtonPressed:[FMCButtonName PRESET_2]];
    [syncBrain unsubscribeButtonPressed:[FMCButtonName PRESET_3]];
    [syncBrain unsubscribeButtonPressed:[FMCButtonName PRESET_4]];
    [syncBrain unsubscribeButtonPressed:[FMCButtonName PRESET_5]];
    [syncBrain unsubscribeButtonPressed:[FMCButtonName PRESET_6]];
    [syncBrain unsubscribeButtonPressed:[FMCButtonName PRESET_7]];
    [syncBrain unsubscribeButtonPressed:[FMCButtonName PRESET_8]];
    [syncBrain unsubscribeButtonPressed:[FMCButtonName PRESET_9]];
    
    //Delete SubMenu
    [syncBrain deleteSubMenuPressedwithID:[NSNumber numberWithInt:SUBMENUID]];
    
    //Delete IntractionChoiceSet
    [syncBrain deleteInteractionChoiceSetPressedWithID:[NSNumber numberWithInt:CHID_INTRACTION]];
    
    [syncBrain onProxyClosed];
}
@end
