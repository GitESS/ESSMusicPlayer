//  SyncBrain.m
//  AppLinkTester
//  Copyright (c) 2012 Ford Motor Company. All rights reserved.

#import "SyncBrain.h"
#import <MediaPlayer/MediaPlayer.h>

#define PLACEHOLDER_APPNAME @"Sync Music App"
#define PLACEHOLDER_APPID @"65537"
#define PREFS_MTU_SIZE @"mtuSize"
#define PREFS_SEND_DELAY @"sendDelay"
#define PREFS_FIRST_RUN @"firstRun"
#define PREFS_PROTOCOL @"protocol"
#define PREFS_IPADDRESS @"ipaddress"
#define PREFS_PORT @"port"
#define PREFS_TYPE @"type"


@implementation SyncBrain
static SyncBrain *gInstance = NULL;
+ (SyncBrain *)sharedInstance
{
	@synchronized(self)
	{
		if (gInstance == NULL)
			gInstance = [[self alloc] init];
	}
	return gInstance;
}


-(void)initProperties{
    _allVoiceCommand=[[NSMutableDictionary alloc] init];
}
//Populating Sync Display Screen with relevant information upon creation
-(void) setup {
    FMCShow* msg = [FMCRPCRequestFactory buildShowWithMainField1:@"Welcome" mainField2:@"Music App" alignment:[FMCTextAlignment CENTERED] correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
	//msg.mediaTrack = @"Sync Music App";
    [proxy sendRPCRequest:msg];
    _allVoiceCommand = [[NSMutableDictionary alloc]init];
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"HMIStatusForNavigate" object:nil]];
}

-(void) sendRPCMessage:(FMCRPCRequest *)rpcMsg {
    [proxy sendRPCRequest:rpcMsg];
    [self postToConsoleLog:rpcMsg];
}



// =====================================
// RPC Function Calls
// =====================================

- (void) setupAppIcon:(NSString *)iconFileName{
    NSLog(@"puting File : %@",iconFileName);
    FMCSetAppIcon * appiCon=[FMCRPCRequestFactory buildSetAppIconWithFileName:iconFileName
                                                                correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
    appiCon.syncFileName=iconFileName;
    [proxy sendRPCRequest:appiCon];
}

- (void) putFileToSYNC:(NSString *)iconFileName{
    NSLog(@"puting File : %@",iconFileName);
    FMCListFiles * listFile=[[FMCListFiles alloc] init];
    [proxy sendRPCRequest:listFile];
}

-(void) subscribeVehicalData{
    
    FMCSubscribeVehicleData * SVD = [FMCRPCRequestFactory buildSubscribeVehicleDataWithGPS:[NSNumber numberWithBool:TRUE]
                                                                                     speed:[NSNumber numberWithBool:TRUE]
                                                                                       rpm:[NSNumber numberWithBool:TRUE]
                                                                                 fuelLevel:[NSNumber numberWithBool:TRUE]
                                                                            fuelLevelState:[NSNumber numberWithBool:TRUE]
                                                                    instantFuelConsumption:[NSNumber numberWithBool:TRUE]
                                                                       externalTemperature:[NSNumber numberWithBool:TRUE]
                                                                                     prndl:[NSNumber numberWithBool:TRUE]
                                                                              tirePressure:[NSNumber numberWithBool:TRUE]
                                                                                  odometer:[NSNumber numberWithBool:TRUE]
                                                                                beltStatus:[NSNumber numberWithBool:TRUE]
                                                                           bodyInformation:[NSNumber numberWithBool:TRUE]
                                                                              deviceStatus:[NSNumber numberWithBool:TRUE]
                                                                             driverBraking:[NSNumber numberWithBool:TRUE]
                                                                               wiperStatus:[NSNumber numberWithBool:TRUE]
                                                                            headLampStatus:[NSNumber numberWithBool:TRUE]
                                                                              engineTorque:[NSNumber numberWithBool:TRUE]
                                                                          accPedalPosition:[NSNumber numberWithBool:TRUE]
                                                                        steeringWheelAngle:[NSNumber numberWithBool:TRUE]
                                                                             correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
    [proxy sendRPCRequest:SVD];
}


-(void) onGetVehicleDataResponse:(FMCGetVehicleDataResponse*) response{
    //[self alert:[NSString stringWithFormat:@"FMCGetVehicleDataResponse"]];
    
}

-(void) onPutFileResponse:(FMCPutFileResponse*) response{
    //[self alert:[NSString stringWithFormat:@"FMCPutFile : Avilable Space %@",response.spaceAvailable]];
    FMCListFiles * listFile=[[FMCListFiles alloc] init];
    [proxy sendRPCRequest:listFile];
}

-(void) onListFilesResponse:(FMCListFilesResponse*) response{
    //[self alert:[NSString stringWithFormat:@"Number of PutFile : %lu  ", (unsigned long)[response.filenames count]]];
    if ([response.filenames count]) {
        //[self alert:[NSString stringWithFormat:@"File Name : %@ ", [response.filenames  objectAtIndex:0]]];
    }
}

-(void) onSetAppIconResponse:(FMCSetAppIconResponse*) response{
}

- (void) showPressed:(NSString *)message {
    FMCShow* msg = [FMCRPCRequestFactory buildShowWithMainField1:message mainField2:@"" alignment:[FMCTextAlignment CENTERED] correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
	//msg.mediaTrack = @"AppLink";
    [proxy sendRPCRequest:msg];
    [self postToConsoleLog:message];;
}

-(void) showAdvancedPressedWithLine1Text:(NSString *)line1Text line2:(NSString *)line2Text line3:(NSString *)line3Text line4:(NSString *)line4Text  statusBar:(NSString *)statusBar mediaClock:(NSString *)mediaClock mediaTrack:(NSString *)mediaTrack alignment:(FMCTextAlignment *)textAlignment {
    FMCShow *msg = [FMCRPCRequestFactory buildShowWithMainField1:line1Text
                                                      mainField2:line2Text
                                                      mainField3:line3Text
                                                      mainField4:line4Text
                                                       statusBar:statusBar
                                                      mediaClock:mediaClock
                                                      mediaTrack:mediaTrack
                                                       alignment:[FMCTextAlignment LEFT_ALIGNED]
                                                         graphic:nil
                                                     softButtons:nil
                                                   customPresets:nil
                                                   correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
    [proxy sendRPCRequest:msg];
    [self postToConsoleLog:msg];;
}

- (void)showPressed:(NSString *)msg1 message2:(NSString *)msg2 message3:(NSString *)msg3 message4:(NSString *)msg4 {
    FMCShow *msg = [FMCRPCRequestFactory buildShowWithMainField1:msg1
                                                      mainField2:msg2
                                                      mainField3:msg3
                                                      mainField4:msg4
                                                       statusBar:nil
                                                      mediaClock:nil
                                                      mediaTrack:nil
                                                       alignment:[FMCTextAlignment LEFT_ALIGNED]
                                                         graphic:nil
                                                     softButtons:nil
                                                   customPresets:nil
                                                   correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
    [proxy sendRPCRequest:msg];
    [self postToConsoleLog:msg];;
}

- (void)showPressed2:(NSString *)msg1 message2:(NSString *)msg2 message3:(NSString *)msg3 message4:(NSString *)msg4  count:(int)msgCount{
    
    NSMutableArray *softButtonArray = [[NSMutableArray alloc] init];
    FMCSoftButton *softButton = [[FMCSoftButton alloc] init];
    //previous
    softButton.softButtonID = [NSNumber numberWithInt:1001];
    softButton.text = @"<<";
    softButton.type = [FMCSoftButtonType BOTH];
    softButton.isHighlighted = [NSNumber numberWithBool:false];
    softButton.systemAction = [FMCSystemAction KEEP_CONTEXT];
    [softButtonArray addObject:softButton];
    //next
    softButton = [[FMCSoftButton alloc] init];
    softButton.softButtonID = [NSNumber numberWithInt:1002];
    softButton.text = @">>";
    softButton.type = [FMCSoftButtonType BOTH];
    softButton.isHighlighted = [NSNumber numberWithBool:false];
    softButton.systemAction = [FMCSystemAction KEEP_CONTEXT];
    [softButtonArray addObject:softButton];
    
    //Back
    softButton = [[FMCSoftButton alloc] init];
    softButton.softButtonID = [NSNumber numberWithInt:1003];
    softButton.text = @"Back";
    softButton.type = [FMCSoftButtonType BOTH];
    softButton.isHighlighted = [NSNumber numberWithBool:false];
    softButton.systemAction = [FMCSystemAction KEEP_CONTEXT];
    [softButtonArray addObject:softButton];
    
    
    if (msgCount==4) {
        
        //[self alert:@"Sync 4"];
        FMCShow *msg = [FMCRPCRequestFactory buildShowWithMainField1:msg1
                                                          mainField2:msg2
                                                          mainField3:msg3
                                                          mainField4:msg4
                                                           statusBar:nil
                                                          mediaClock:nil
                                                          mediaTrack:nil
                                                           alignment:[FMCTextAlignment LEFT_ALIGNED]
                                                             graphic:nil
                                                         softButtons:softButtonArray
                                                       customPresets:nil
                                                       correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
        
        [proxy sendRPCRequest:msg];
        
    }else if (msgCount == 3){
        
        // [self alert:@"Sync 3"];
        FMCShow *msg = [FMCRPCRequestFactory buildShowWithMainField1:msg1
                                                          mainField2:msg2
                                                          mainField3:msg3
                                                          mainField4:@""
                                                           statusBar:nil
                                                          mediaClock:nil
                                                          mediaTrack:nil
                                                           alignment:[FMCTextAlignment LEFT_ALIGNED]
                                                             graphic:nil
                                                         softButtons:softButtonArray
                                                       customPresets:nil
                                                       correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
        
        [proxy sendRPCRequest:msg];
        
    }else if (msgCount == 2){
        
        //[self alert:@"Sync 2"];
        FMCShow *msg = [FMCRPCRequestFactory buildShowWithMainField1:msg1
                                                          mainField2:msg2
                                                          mainField3:@""
                                                          mainField4:@""
                                                           statusBar:nil
                                                          mediaClock:nil
                                                          mediaTrack:nil
                                                           alignment:[FMCTextAlignment LEFT_ALIGNED]
                                                             graphic:nil
                                                         softButtons:softButtonArray
                                                       customPresets:nil
                                                       correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
        
        [proxy sendRPCRequest:msg];
    }else if (msgCount == 1){
        
        //[self alert:@"Sync 1"];
        FMCShow *msg = [FMCRPCRequestFactory buildShowWithMainField1:msg1
                                                          mainField2:@""
                                                          mainField3:@""
                                                          mainField4:@""
                                                           statusBar:nil
                                                          mediaClock:nil
                                                          mediaTrack:nil
                                                           alignment:[FMCTextAlignment LEFT_ALIGNED]
                                                             graphic:nil
                                                         softButtons:softButtonArray
                                                       customPresets:nil
                                                       correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
        
        
        [proxy sendRPCRequest:msg];
    }
    
    
    
    
    
}

//ScrollableMessage
- (void)scrollableMessagePressedWithScrollableMessageBody:(NSString *)scrollableMessageBody timeOut :(NSNumber *)timeOut softButtons:(NSArray *)softbuttons
{
    FMCScrollableMessage *req = [FMCRPCRequestFactory buildScrollableMessage:scrollableMessageBody timeout:timeOut softButtons:softbuttons correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
    
    [proxy sendRPCRequest:req];
    
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:req]];
}


//SoftButton Example with FMCShow RPC method
- (void) showPressed:(NSString *)message  WithSubMessage:(NSString *)subMessage{
    NSMutableArray *softButtonArray = [[NSMutableArray alloc] init];
    FMCSoftButton *softButton = [[FMCSoftButton alloc] init];
    softButton.softButtonID = [NSNumber numberWithInt:5001];
    softButton.text = @"Album";
    //softButton.image = [[FMCImage alloc] init] ;
    //softButton.image.imageType = [FMCImageType STATIC];
    //softButton.image.value = [NSString stringWithFormat:@"%d", i];
    softButton.type = [FMCSoftButtonType BOTH];
    softButton.isHighlighted = [NSNumber numberWithBool:false];
    softButton.systemAction = [FMCSystemAction KEEP_CONTEXT];
    [softButtonArray addObject:softButton];
    softButton = nil;
    softButton = [[FMCSoftButton alloc] init];
    softButton.softButtonID = [NSNumber numberWithInt:5002];
    softButton.text = @"Song";
    //softButton.image = [[FMCImage alloc] init] ;
    //softButton.image.imageType = [FMCImageType STATIC];
    //softButton.image.value = [NSString stringWithFormat:@"%d", i];
    softButton.type = [FMCSoftButtonType BOTH];
    softButton.isHighlighted = [NSNumber numberWithBool:false];
    softButton.systemAction = [FMCSystemAction KEEP_CONTEXT];
    [softButtonArray addObject:softButton];
    softButton = nil;
    softButton = [[FMCSoftButton alloc] init];
    softButton.softButtonID = [NSNumber numberWithInt:5003];
    softButton.text = @"SongInfo";
    //softButton.image = [[FMCImage alloc] init] ;
    //softButton.image.imageType = [FMCImageType STATIC];
    //softButton.image.value = [NSString stringWithFormat:@"%d", i];
    softButton.type = [FMCSoftButtonType BOTH];
    softButton.isHighlighted = [NSNumber numberWithBool:false];
    softButton.systemAction = [FMCSystemAction KEEP_CONTEXT];
    [softButtonArray addObject:softButton];
    softButton = nil;
    softButton = [[FMCSoftButton alloc] init];
    softButton.softButtonID = [NSNumber numberWithInt:5004];
    softButton.text = @"Vehicle";
    //softButton.image = [[FMCImage alloc] init] ;
    //softButton.image.imageType = [FMCImageType STATIC];
    //softButton.image.value = [NSString stringWithFormat:@"%d", i];
    softButton.type = [FMCSoftButtonType BOTH];
    softButton.isHighlighted = [NSNumber numberWithBool:false];
    softButton.systemAction = [FMCSystemAction KEEP_CONTEXT];
    [softButtonArray addObject:softButton];
    softButton = nil;
    softButton = [[FMCSoftButton alloc] init];
    softButton.softButtonID = [NSNumber numberWithInt:5005];
    softButton.text = @"VocRec.";
    //softButton.image = [[FMCImage alloc] init] ;
    //softButton.image.imageType = [FMCImageType STATIC];
    //softButton.image.value = [NSString stringWithFormat:@"%d", i];
    softButton.type = [FMCSoftButtonType BOTH];
    softButton.isHighlighted = [NSNumber numberWithBool:false];
    softButton.systemAction = [FMCSystemAction KEEP_CONTEXT];
    [softButtonArray addObject:softButton];
    softButton = nil;
    softButton = [[FMCSoftButton alloc] init];
    softButton.softButtonID = [NSNumber numberWithInt:5006];
    softButton.text = @"Feature";
    //softButton.image = [[FMCImage alloc] init] ;
    //softButton.image.imageType = [FMCImageType STATIC];
    //softButton.image.value = [NSString stringWithFormat:@"%d", i];
    softButton.type = [FMCSoftButtonType BOTH];
    softButton.isHighlighted = [NSNumber numberWithBool:false];
    softButton.systemAction = [FMCSystemAction KEEP_CONTEXT];
    [softButtonArray addObject:softButton];
    softButton = nil;
    softButton = [[FMCSoftButton alloc] init];
    softButton.softButtonID = [NSNumber numberWithInt:5007];
    softButton.text = @"AppInfo";
    //softButton.image = [[FMCImage alloc] init] ;
    //softButton.image.imageType = [FMCImageType STATIC];
    //softButton.image.value = [NSString stringWithFormat:@"%d", i];
    softButton.type = [FMCSoftButtonType BOTH];
    softButton.isHighlighted = [NSNumber numberWithBool:false];
    softButton.systemAction = [FMCSystemAction KEEP_CONTEXT];
    [softButtonArray addObject:softButton];
    softButton = nil;
    softButton = [[FMCSoftButton alloc] init];
    softButton.softButtonID = [NSNumber numberWithInt:5008];
    softButton.text = @"AppLink";
    //softButton.image = [[FMCImage alloc] init] ;
    //softButton.image.imageType = [FMCImageType STATIC];
    //softButton.image.value = [NSString stringWithFormat:@"%d", i];
    softButton.type = [FMCSoftButtonType BOTH];
    softButton.isHighlighted = [NSNumber numberWithBool:false];
    softButton.systemAction = [FMCSystemAction KEEP_CONTEXT];
    [softButtonArray addObject:softButton];
    softButton = nil;
    
    FMCShow *msg = [FMCRPCRequestFactory buildShowWithMainField1:message
                                                      mainField2:subMessage
                                                      mainField3:nil
                                                      mainField4:nil
                                                       statusBar:nil
                                                      mediaClock:nil
                                                      mediaTrack:nil
                                                       alignment:[FMCTextAlignment CENTERED]
                                                         graphic:nil
                                                     softButtons:softButtonArray
                                                   customPresets:nil
                                                   correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
    
    [proxy sendRPCRequest:msg];
    [self postToConsoleLog:msg];;
}

-(void) unregisterAppInterfacePressed {
	FMCUnregisterAppInterface* req = [FMCRPCRequestFactory buildUnregisterAppInterfaceWithCorrelationID:[NSNumber numberWithInt:autoIncCorrID++]];
    [proxy sendRPCRequest:req];
    [self postToConsoleLog:req];
}

-(void) setMediaClockTimerPressedwithHours:(NSNumber *)hours minutes:(NSNumber *)minutes seconds:(NSNumber *)seconds updateMode:(FMCUpdateMode *)updateMode {
    FMCSetMediaClockTimer *req = [FMCRPCRequestFactory buildSetMediaClockTimerWithHours:hours minutes:minutes seconds:seconds updateMode:updateMode correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
    [proxy sendRPCRequest:req];
    [self postToConsoleLog:req];
}

- (void) speakPressed:(NSString *)message {
    FMCSpeak* req = [FMCRPCRequestFactory buildSpeakWithTTS:message correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
    [proxy sendRPCRequest:req];
    [self postToConsoleLog:req];
}

- (void) alertPressed:(NSString *)message {
    FMCAlert* req = [FMCRPCRequestFactory buildAlertWithTTS:message alertText1:message alertText2:@"" playTone:[NSNumber numberWithBool:YES] duration:[NSNumber numberWithInt:5000] correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
    [proxy sendRPCRequest:req];
    [self postToConsoleLog:req];
}

-(void) alertAdvancedPressedwithTTSChunks:(NSArray *)ttsChucks alertText1:(NSString *)alertText1 alertText2:(NSString *)alertText2 alertText3:(NSString *)alertText3  playTone:(NSNumber *)playTone duration:(NSNumber *)duration softButtons:(NSArray *)softButtons {
    
    
    FMCAlert *req = [FMCRPCRequestFactory buildAlertWithTTSChunks:ttsChucks alertText1:alertText1 alertText2:alertText2 alertText3:alertText3 playTone:playTone duration:duration softButtons:softButtons correlationID:[NSNumber numberWithInt:autoIncCorrID++] ];
    [proxy sendRPCRequest:req];
    [self postToConsoleLog:req];
}

-(void) addCommand:(NSString *)message {
    NSArray *vrc = [NSArray arrayWithObjects:message, nil];
    FMCAddCommand *command = [FMCRPCRequestFactory buildAddCommandWithID:[NSNumber numberWithInt:cmdID] menuName:message vrCommands:vrc correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
    [proxy sendRPCRequest:command];
    //[self alert:message];
    [_allVoiceCommand setObject:message forKey:[NSString stringWithFormat:@"%d",cmdID]];
    cmdID++;
    [self postToConsoleLog:command];
}


-(void) addAdvancedCommandPressedwithMenuName:(NSString *)menuName position:(NSNumber *)position parentID:(NSNumber *)parentID vrCommands:(NSArray *) vrCommands iconValue:(NSString *)iconValue iconType:(FMCImageType *)iconType {
    [FMCDebugTool logInfo:@"Added addCommand with cmdID = %d and correlationID = %d", cmdID, autoIncCorrID];
    FMCAddCommand *command = [FMCRPCRequestFactory buildAddCommandWithID:[NSNumber numberWithInt:cmdID] menuName:menuName parentID:parentID position:position vrCommands:vrCommands iconValue:iconValue iconType:iconType correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
    [proxy sendRPCRequest:command];
    cmdID++;
    [self postToConsoleLog:command];
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"AddCommandRequest" object:command]];
}

- (void) speakTTSChunksPressed {
    FMCSpeak* req = [FMCRPCRequestFactory buildSpeakWithTTS:@"Speak, here comes a jingle" correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
    [(NSMutableArray*)req.ttsChunks addObject:[FMCTTSChunkFactory buildTTSChunkForString:FMCJingle.INITIAL_JINGLE type:FMCSpeechCapabilities.PRE_RECORDED]];
	[(NSMutableArray*)req.ttsChunks addObject:[FMCTTSChunkFactory buildTTSChunkForString:@", ah, that's nice. Now example of SAPI Phonemes. Live." type:FMCSpeechCapabilities.SAPI_PHONEMES]];
    [(NSMutableArray*)req.ttsChunks addObject:[FMCTTSChunkFactory buildTTSChunkForString:@"_ l ay v ." type:FMCSpeechCapabilities.SAPI_PHONEMES]];
    [(NSMutableArray*)req.ttsChunks addObject:[FMCTTSChunkFactory buildTTSChunkForString:@", Read." type:FMCSpeechCapabilities.SAPI_PHONEMES]];
    [(NSMutableArray*)req.ttsChunks addObject:[FMCTTSChunkFactory buildTTSChunkForString:@"_ R a d ." type:FMCSpeechCapabilities.SAPI_PHONEMES]];
    [proxy sendRPCRequest:req];
    [self postToConsoleLog:req];
}

- (void) speakStringUsingTTS:(NSString *)stringValue {
    FMCSpeak* req = [FMCRPCRequestFactory buildSpeakWithTTS:stringValue correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
    [proxy sendRPCRequest:req];
    [self postToConsoleLog:req];
}
- (void) speakStringUsingTTSChunks:(NSArray *)featureChunkArray {
    
    if ([featureChunkArray count]) {
        FMCSpeak* req = [FMCRPCRequestFactory buildSpeakWithTTS:(NSString *)[featureChunkArray objectAtIndex:0]  correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
        [(NSMutableArray*)req.ttsChunks addObject:[FMCTTSChunkFactory buildTTSChunkForString:FMCJingle.INITIAL_JINGLE type:FMCSpeechCapabilities.PRE_RECORDED]];
        for (int i=1; i<[featureChunkArray count]; i++) {
            [(NSMutableArray*)req.ttsChunks addObject:[FMCTTSChunkFactory buildTTSChunkForString:(NSString *)[featureChunkArray objectAtIndex:i] type:FMCSpeechCapabilities.TEXT]];
        }
        [proxy sendRPCRequest:req];
        
        [self postToConsoleLog:req];
    }
}

-(void) deleteCommandPressed:(NSNumber *)commandID {
    FMCDeleteCommand *req = [FMCRPCRequestFactory
                             buildDeleteCommandWithID:commandID
                             correlationID:[NSNumber
                                            numberWithInt:autoIncCorrID++]];
    [proxy sendRPCRequest:req];
    [self postToConsoleLog:req];
}

-(void) addSubMenuPressedwithID:(NSNumber *)menuID menuName:(NSString *)menuName
                       position:(NSNumber *)position {
    FMCAddSubMenu *req =
    [FMCRPCRequestFactory buildAddSubMenuWithID:menuID
                                       menuName:menuName
                                       position:position correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
    [proxy sendRPCRequest:req];
    [self postToConsoleLog:req];
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"AddSubMenuRequest" object:req]];
}

-(void) deleteSubMenuPressedwithID:(NSNumber *)menuID {
    FMCDeleteSubMenu *req = [FMCRPCRequestFactory buildDeleteSubMenuWithID:menuID correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
    [proxy sendRPCRequest:req];
    [self postToConsoleLog:req];
}

-(void) createInteractionChoiceSetPressedWithID:(NSNumber *)interactionChoiceSetID choiceSet:(NSArray *)choices {
    FMCCreateInteractionChoiceSet *req = [FMCRPCRequestFactory buildCreateInteractionChoiceSetWithID:interactionChoiceSetID choiceSet:choices correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
    [proxy sendRPCRequest:req];
    [self postToConsoleLog:req];
}

-(void) deleteInteractionChoiceSetPressedWithID:(NSNumber *)interactionChoiceSetID {
    FMCDeleteInteractionChoiceSet *req = [FMCRPCRequestFactory buildDeleteInteractionChoiceSetWithID:interactionChoiceSetID correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
    [proxy sendRPCRequest:req];
    [self postToConsoleLog:req];
}

-(void) performInteractionPressedwithInitialPrompt:(NSArray*)initialChunks initialText:(NSString*)initialText interactionChoiceSetIDList:(NSArray*)interactionChoiceSetIDList helpChunks:(NSArray*)helpChunks timeoutChunks:(NSArray*)timeoutChunks interactionMode:(FMCInteractionMode*) interactionMode timeout:(NSNumber*)timeout vrHelp:(NSArray*)vrHelp {
    FMCPerformInteraction *req = [FMCRPCRequestFactory buildPerformInteractionWithInitialChunks:initialChunks initialText:initialText interactionChoiceSetIDList:interactionChoiceSetIDList helpChunks:helpChunks timeoutChunks:timeoutChunks interactionMode:interactionMode timeout:timeout vrHelp: vrHelp correlationID:[NSNumber numberWithInt:autoIncCorrID++] ];
    [proxy sendRPCRequest:req];
    [self postToConsoleLog:req];
}

-(void) subscribeButtonPressed:(FMCButtonName *)buttonName {
    FMCSubscribeButton *req = [FMCRPCRequestFactory buildSubscribeButtonWithName:buttonName correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
    [proxy sendRPCRequest:req];
    [self postToConsoleLog:req];
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"SubscribeButtonRequest" object:req]];
}

-(void) unsubscribeButtonPressed:(FMCButtonName *)buttonName {
    FMCUnsubscribeButton *req = [FMCRPCRequestFactory buildUnsubscribeButtonWithName:buttonName correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
    [proxy sendRPCRequest:req];
    [self postToConsoleLog:req];
}

-(void) sendEncodedSyncPData:(NSMutableArray *)data {
    /*   FMCEncodedSyncPData* req = [FMCRPCRequestFactory buildEncodedSyncPDataWithData:data correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
     [proxy sendRPCRequest:req];
     [self postToConsoleLog:response];
     */
}

-(void) setGlobalPropertiesPressedWithHelpText:(NSString *)helpText timeoutText:(NSString *)timeoutText {
    FMCSetGlobalProperties *req = [FMCRPCRequestFactory buildSetGlobalPropertiesWithHelpText:helpText timeoutText:timeoutText correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
    [proxy sendRPCRequest:req];
    [self postToConsoleLog:req];
}

-(void) resetGlobalPropertiesPressedwithProperties:(NSArray *)properties {
    FMCResetGlobalProperties *req = [FMCRPCRequestFactory buildResetGlobalPropertiesWithProperties:properties correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
    [proxy sendRPCRequest:req];
    [self postToConsoleLog:req];
    
}

//PerformAudioPassThru
- (void)performAudioPassThruPressedWithInitialPrompt:(NSString *)initialPrompt
                                        disPlayText1:(NSString *)disPlayText1
                                        disPlayText2:(NSString *)disPlayText2
                                        samplingRate:(FMCSamplingRate *)samplingRate
                                         maxDuration:(NSNumber *)maxDuration
                                       bitsPerSample:(FMCBitsPerSample *)bitsPerSample
                                           audioType:(FMCAudioType *)audioType
                                           muteAudio:(NSNumber *)muteAudio

{
    audioPassThruData = [[NSMutableData alloc] init];
    
    FMCPerformAudioPassThru *req = [FMCRPCRequestFactory buildPerformAudioPassThruWithInitialPrompt:initialPrompt
                                                                          audioPassThruDisplayText1:disPlayText1
                                                                          audioPassThruDisplayText2:disPlayText2
                                                                                       samplingRate:samplingRate
                                                                                        maxDuration:maxDuration
                                                                                      bitsPerSample:bitsPerSample
                                                                                          audioType:audioType
                                                                                          muteAudio:muteAudio
                                                                                      correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
    [proxy sendRPCRequest:req];
    
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:req]];
    
}

//EndAudioPassThru
- (void)endAudioPassThruPressed
{
    FMCEndAudioPassThru *req = [FMCRPCRequestFactory buildEndAudioPassThruWithCorrelationID:[NSNumber numberWithInt:autoIncCorrID++]];
    [proxy sendRPCRequest:req];
    
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:req]];
}

//SubscribeVehicleData
- (void)subscribeVehicleDataPressedWithGps:(NSNumber *)gps speed:(NSNumber *)speed rpm:(NSNumber *)rpm fuelLevel:(NSNumber *)fuelLevel
                            fuelLevelState:(NSNumber *)fuelLevelState  instantFuelConsumption:(NSNumber *)instantFuelConsumption
                      externalTemperature :(NSNumber *)externalTemperature prndl:(NSNumber *)prndl tirePressure:(NSNumber *)tirePressure
                                  odometer:(NSNumber *)odometer
                                beltStatus:(NSNumber *)beltStatus
                           bodyInformation:(NSNumber *)bodyInformation
                              deviceStatus:(NSNumber *)deviceStatus
                             driverBraking:(NSNumber *)driverBraking
                               wiperStatus:(NSNumber *)wiperStatus
                            headLampStatus:(NSNumber *)headLampStatus
                              engineTorque:(NSNumber *)engineTorque
                          accPedalPosition:(NSNumber *)accPedalPosition
                        steeringWheelAngle:(NSNumber *)steeringWheelAngle
{
    FMCSubscribeVehicleData  *req = [FMCRPCRequestFactory  buildSubscribeVehicleDataWithGPS:gps  speed:speed  rpm:rpm
                                                                                  fuelLevel:fuelLevel
                                                                             fuelLevelState:fuelLevelState
                                                                     instantFuelConsumption:instantFuelConsumption
                                                                        externalTemperature:externalTemperature
                                                                                      prndl:prndl
                                                                               tirePressure:tirePressure
                                                                                   odometer:odometer
                                                                                 beltStatus:beltStatus
                                                                            bodyInformation:bodyInformation
                                                                               deviceStatus:deviceStatus
                                                                              driverBraking:driverBraking
                                                                                wiperStatus:wiperStatus
                                                                             headLampStatus:headLampStatus
                                                                               engineTorque:engineTorque
                                                                           accPedalPosition:accPedalPosition
                                                                         steeringWheelAngle:steeringWheelAngle
                                                                              correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
    
    [proxy sendRPCRequest:req];
    
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:req]];
}

//UnsubscribeVehicleData
- (void)unSubscribeVehicleDataPressedWithGps:(NSNumber *)gps speed:(NSNumber *)speed rpm:(NSNumber *)rpm fuelLevel:(NSNumber *)fuelLevel
                              fuelLevelState:(NSNumber *)fuelLevelState  instantFuelConsumption:(NSNumber *)instantFuelConsumption
                        externalTemperature :(NSNumber *)externalTemperature prndl:(NSNumber *)prndl
                                tirePressure:(NSNumber *)tirePressure
                                    odometer:(NSNumber *)odometer
                                  beltStatus:(NSNumber *)beltStatus
                             bodyInformation:(NSNumber *)bodyInformation
                                deviceStatus:(NSNumber *)deviceStatus
                               driverBraking:(NSNumber *)driverBraking
                                 wiperStatus:(NSNumber *)wiperStatus
                              headLampStatus:(NSNumber *)headLampStatus
                                engineTorque:(NSNumber *)engineTorque
                            accPedalPosition:(NSNumber *)accPedalPosition
                          steeringWheelAngle:(NSNumber *)steeringWheelAngle
{
    FMCUnsubscribeVehicleData *req = [FMCRPCRequestFactory buildUnsubscribeVehicleDataWithGPS:gps speed:speed rpm:rpm
                                                                                    fuelLevel:fuelLevel
                                                                               fuelLevelState:fuelLevelState
                                                                       instantFuelConsumption:instantFuelConsumption
                                                                          externalTemperature:externalTemperature
                                                                                        prndl:prndl
                                                                                 tirePressure:tirePressure
                                                                                     odometer:odometer
                                                                                   beltStatus:beltStatus
                                                                              bodyInformation:bodyInformation
                                                                                 deviceStatus:deviceStatus
                                                                                driverBraking:driverBraking
                                                                                  wiperStatus:wiperStatus
                                                                               headLampStatus:headLampStatus
                                                                                 engineTorque:engineTorque
                                                                             accPedalPosition:accPedalPosition
                                                                           steeringWheelAngle:steeringWheelAngle
                                                                                correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
    [proxy sendRPCRequest:req];
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:req]];
}

//GetVehicleData
- (void)getVehicleDataPressedWithGps:(NSNumber *)gps speed:(NSNumber *)speed rpm:(NSNumber *)rpm fuelLevel:(NSNumber *)fuelLevel
                      fuelLevelState:(NSNumber *)fuelLevelState  instantFuelConsumption:(NSNumber *)instantFuelConsumption
                externalTemperature :(NSNumber *)externalTemperature
                                 vin:(NSNumber *)vin
                               prndl:(NSNumber *)prndl
                        tirePressure:(NSNumber *)tirePressure
                            odometer:(NSNumber *)odometer
                          beltStatus:(NSNumber *)beltStatus
                     bodyInformation:(NSNumber *)bodyInformation
                        deviceStatus:(NSNumber *)deviceStatus
                       driverBraking:(NSNumber *)driverBraking
                         wiperStatus:(NSNumber *)wiperStatus
                      headLampStatus:(NSNumber *)headLampStatus
                        engineTorque:(NSNumber *)engineTorque
                    accPedalPosition:(NSNumber *)accPedalPosition
                  steeringWheelAngle:(NSNumber *)steeringWheelAngle
{
    FMCGetVehicleData *req = [FMCRPCRequestFactory buildGetVehicleDataWithGPS:gps
                                                                        speed:speed
                                                                          rpm:rpm
                                                                    fuelLevel:fuelLevel
                                                               fuelLevelState:fuelLevelState
                                                       instantFuelConsumption:instantFuelConsumption
                                                          externalTemperature:externalTemperature
                                                                          vin:vin
                                                                        prndl:prndl
                                                                 tirePressure:tirePressure
                                                                     odometer:odometer
                                                                   beltStatus:beltStatus
                                                              bodyInformation:bodyInformation
                                                                 deviceStatus:deviceStatus
                                                                driverBraking:driverBraking
                                                                  wiperStatus:wiperStatus
                                                               headLampStatus:headLampStatus
                                                                 engineTorque:engineTorque
                                                             accPedalPosition:accPedalPosition
                                                           steeringWheelAngle:steeringWheelAngle
                                                                correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
    [proxy sendRPCRequest:req];
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:req]];
    
}

//Slider
- (void)sliderPressedWithNumTicks:(NSNumber *)numTicks position:(NSNumber *)position sliderHeader:(NSString *)sliderHeader sliderFooter:(NSArray *)
sliderFooter timeOut :(NSNumber *)timeout
{
    FMCSlider *req = [FMCRPCRequestFactory buildSliderDynamicFooterWithNumTicks:numTicks position:position sliderHeader:sliderHeader    sliderFooter:sliderFooter timeout:timeout correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
    
    [proxy sendRPCRequest:req];
    
    
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:req]];
}

//ShowConstantTBT
- (void)showConstantTBTPressedWithNavigationText1:(NSString *)navigationText1 WithNavigationText2:(NSString *)navigationText2 eta:(NSString *)eta
                                    totalDistance:(NSString *)totalDistance turnIcon :(FMCImage *)turnImage
                               distanceToManeuver:(NSNumber *)distanceToManeuver
                          distanceToManeuverScale:(NSNumber *)distanceToManeuverScale
                                 maneuverComplete:(NSNumber *) maneuverComplete
                                      softButtons:(NSArray *)softButton
{
    FMCShowConstantTBT *req = [FMCRPCRequestFactory buildShowConstantTBTWithNavigationText1:navigationText1 navigationText2:navigationText2
                                                                                        eta:eta
                                                                              totalDistance:totalDistance
                                                                                   turnIcon:turnImage
                                                                         distanceToManeuver:distanceToManeuver
                                                                    distanceToManeuverScale:distanceToManeuverScale
                                                                           maneuverComplete:maneuverComplete
                                                                                softButtons:softButton
                                                                              correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
    
    [proxy sendRPCRequest:req];
    
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:req]];
    
}

//AlertManeuver
- (void)alertManeuverPressedWithTTsChunks:(NSArray *)ttsChunk softButtons:(NSArray *)softButton
{
    FMCAlertManeuver *req = [FMCRPCRequestFactory buildAlertManeuverWithTTSChunks:ttsChunk softButtons:softButton correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
    
    [proxy sendRPCRequest:req];
    
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:req]];
}

//UpdateTurnList

- (void)updateTurnListPressedWithTurnList:(NSArray *)turnList softButtons:(NSArray *)softButton
{
    //FMCTurn  FMCSoftButton
    FMCUpdateTurnList *req = [FMCRPCRequestFactory buildUpdateTurnList:turnList softButtons:softButton correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
    
    [proxy sendRPCRequest:req];
    
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:req]];
}

//ChangeRegistration
- (void)changeRegistrationPressedWithLanguage:(FMCLanguage *)language WithHmiDisplayLanguage:(FMCLanguage *)hmiDisplayLanguage
{
    FMCChangeRegistration *req = [FMCRPCRequestFactory buildChangeRegistrationWithLanguage:language hmiDisplayLanguage:hmiDisplayLanguage correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
    
    [proxy sendRPCRequest:req];
    
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:req]];
    
}
-(int)getCMDID {
    return cmdID;
}

// =====================================
// Proxy Life Management Functions
// =====================================


-(void) savePreferences {
    
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    //Set to match settings.bundle defaults
    if (![[prefs objectForKey:PREFS_FIRST_RUN] isEqualToString:@"False"]) {
        [prefs setObject:@"False" forKey:PREFS_FIRST_RUN];
        [prefs setObject:@"iap" forKey:PREFS_PROTOCOL];
        [prefs setObject:@"192.168.0.1" forKey:PREFS_IPADDRESS];
        [prefs setObject:@"50007" forKey:PREFS_PORT];
    }
	[prefs synchronize];
}

-(void) setupProxy {
    
    [FMCDebugTool logInfo:@"setupProxy"];
    
    [self savePreferences];
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    if ([[prefs objectForKey:PREFS_PROTOCOL] isEqualToString:@"tcpl"]) {
        proxy = [FMCSyncProxyFactory buildSyncProxyWithListener: self
                                                   tcpIPAddress: nil
                                                        tcpPort: [prefs objectForKey:PREFS_PORT]];
    } else if ([[prefs objectForKey:PREFS_PROTOCOL] isEqualToString:@"tcps"]) {
        proxy = [FMCSyncProxyFactory buildSyncProxyWithListener: self
                                                   tcpIPAddress: [prefs objectForKey:PREFS_IPADDRESS]
                                                        tcpPort: [prefs objectForKey:PREFS_PORT]];
    } else
        proxy = [FMCSyncProxyFactory buildSyncProxyWithListener: self];
    
    [proxy.getTransport addTransportListener:self];
    
    autoIncCorrID = 101;
}

-(void) onProxyOpened {
    [FMCDebugTool logInfo:@"onProxyOpened"];
    FMCRegisterAppInterface* regRequest = [FMCRPCRequestFactory buildRegisterAppInterfaceWithAppName:PLACEHOLDER_APPNAME languageDesired:[FMCLanguage EN_US] appID:PLACEHOLDER_APPID];
    regRequest.isMediaApplication = [NSNumber numberWithBool:YES];
    regRequest.ngnMediaScreenAppName = nil;
    regRequest.vrSynonyms = nil;
    [proxy sendRPCRequest:regRequest];
}

-(void) onError:(NSException*) e {
	[FMCDebugTool logInfo:@"proxy error occurred: %@", e];
}

-(void) onProxyClosed {
    [FMCDebugTool logInfo:@"onProxyClosed"];
    [self tearDownProxy];
	[self setupProxy];
}

-(void) onOnHMIStatus:(FMCOnHMIStatus*) notification {
    
    if (notification.hmiLevel == FMCHMILevel.HMI_NONE ) {
		
        [FMCDebugTool logInfo:@"HMI_NONE"];
        
	} else if (notification.hmiLevel == FMCHMILevel.HMI_FULL ) {
        
        [FMCDebugTool logInfo:@"HMI_FULL"];
        if	(syncInitialized)
            return;
        syncInitialized = YES;
        [self setup];
        FMCShow* msg = [FMCRPCRequestFactory buildShowWithMainField1:@"Sync" mainField2:@"Music Player" alignment:[FMCTextAlignment CENTERED] correlationID:[NSNumber numberWithInt:autoIncCorrID++]];
		[proxy sendRPCRequest:msg];
        
    } else if (notification.hmiLevel == FMCHMILevel.HMI_BACKGROUND ) {
        
        [FMCDebugTool logInfo:@"HMI_BACKGROUND"];
        
    } else if (notification.hmiLevel == FMCHMILevel.HMI_LIMITED ) {
        
        [FMCDebugTool logInfo:@"HMI_LIMTED"];
	}
}

-(void) tearDownProxy {
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"UnsubscribeVehicleData" object:nil]];
   
	[FMCDebugTool logInfo:@"tearDownProxy"];
	[proxy dispose];
    
	proxy = nil;
}

-(void) onOnDriverDistraction:(FMCOnDriverDistraction*)notification {
    NSLog(@"--------------------------------------3");
    
    if (notification.state == FMCDriverDistractionState.DD_OFF ) {
        isDD = NO;
        [FMCDebugTool logInfo:@"DD Off"];
        
	} else if (notification.state == FMCDriverDistractionState.DD_ON ) {
        isDD = YES;
        [FMCDebugTool logInfo:@"DD On"];
        
    }
}

// FMCTransportListener Methods:
- (void) onTransportConnected{
}
- (void) onTransportDisconnected{
    NSLog(@"--------------------------------------2");
    
    [FMCDebugTool logInfo:@"onTransportDisconnected"];
    
}
- (void) onBytesReceived:(Byte*)bytes length:(long) length{
    
    
}

// =====================================
// Implementation of FMCProxyListener
// =====================================

-(void) onOnButtonEvent:(FMCOnButtonEvent*) notification {
	[[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"NewConsoleControllerObject" object:notification]];
}

-(void) onOnButtonPress:(FMCOnButtonPress*) notification {
    //int idBtn = [notification.customButtonID intValue];
    //[self alert: [NSString stringWithFormat:@"Soft Button Press %i",idBtn]];
    
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"musicPlay" object:notification]];
	[[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"NewConsoleControllerObject" object:notification]];
}
-(void) onOnCommand:(FMCOnCommand*) notification {
	[[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"CommandAction" object:notification]];
	[[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"NewConsoleControllerObject" object:notification]];
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"onVoiceCommand" object:notification]];
}
-(void) onOnAppInterfaceUnregistered:(FMCOnAppInterfaceUnregistered*) notification {
	[[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"NewConsoleControllerObject" object:notification]];
}

-(void) onAddCommandResponse:(FMCAddCommandResponse*) response {
    [self postToConsoleLog:response];
}
-(void) onAddSubMenuResponse:(FMCAddSubMenuResponse*) response {
    [self postToConsoleLog:response];
}
-(void) onCreateInteractionChoiceSetResponse:(FMCCreateInteractionChoiceSetResponse*) response {
  	[self postToConsoleLog:response];
}
-(void) onDeleteCommandResponse:(FMCDeleteCommandResponse*) response {
	[self postToConsoleLog:response];
}
-(void) onDeleteInteractionChoiceSetResponse:(FMCDeleteInteractionChoiceSetResponse*) response {
    [self postToConsoleLog:response];
}
-(void) onDeleteSubMenuResponse:(FMCDeleteSubMenuResponse*) response {
    [self postToConsoleLog:response];
}
-(void) onPerformInteractionResponse:(FMCPerformInteractionResponse*) response {
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"onChoice" object:response]];
	[self postToConsoleLog:response];
}
-(void) onRegisterAppInterfaceResponse:(FMCRegisterAppInterfaceResponse*) response {
	[self postToConsoleLog:response];
}
-(void) onSetGlobalPropertiesResponse:(FMCSetGlobalPropertiesResponse*) response {
	[self postToConsoleLog:response];
}
-(void) onResetGlobalPropertiesResponse:(FMCResetGlobalPropertiesResponse*) response {
	[self postToConsoleLog:response];
}
-(void) onSetMediaClockTimerResponse:(FMCSetMediaClockTimerResponse*) response {
	[self postToConsoleLog:response];
}

-(void) onShowResponse:(FMCShowResponse*) response {
	[self postToConsoleLog:response];
}

-(void) onSpeakResponse:(FMCSpeakResponse*) response {
	[self postToConsoleLog:response];
}
-(void) onAlertResponse:(FMCAlertResponse*) response {
	[[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"AddCommand" object:response]];
	[self postToConsoleLog:response];
}
-(void) onSubscribeButtonResponse:(FMCSubscribeButtonResponse*) response {
	[self postToConsoleLog:response];
}
-(void) onUnregisterAppInterfaceResponse:(FMCUnregisterAppInterfaceResponse*) response {
    [self postToConsoleLog:response];
}
-(void) onUnsubscribeButtonResponse:(FMCUnsubscribeButtonResponse*) response {
    [self postToConsoleLog:response];
}
-(void) onGenericResponse:(FMCGenericResponse*) response
{
    [self postToConsoleLog:response];
}

-(void)alert:(NSString *)msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                    message:msg
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"OK", nil];
    [alert show];
    
}


-(void) onAlertManeuverResponse:(FMCAlertManeuverResponse*) response {
    [self postToConsoleLog:response];
}

-(void) onChangeRegistrationResponse:(FMCChangeRegistrationResponse*) response {
    [self postToConsoleLog:response];
}

-(void) onDeleteFileResponse:(FMCDeleteFileResponse*) response {
    [self postToConsoleLog:response];
}

-(void) onEndAudioPassThruResponse:(FMCEndAudioPassThruResponse*) response {
    [self postToConsoleLog:response];
    [self alert:@"EndAudioPassThroughResponse"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"EndAudioPassThruResponse" object:nil];
    
}


-(void) onGetDTCsResponse:(FMCGetDTCsResponse*) response {
    [self postToConsoleLog:response];
}


-(void) onOnAudioPassThru:(FMCOnAudioPassThru*) notification {
    [self postToConsoleLog:notification];
    
    //Fill Buffer
     NSData *test = [NSData dataWithData:notification.bulkData];
    [audioPassThruData appendData:test];
    //Write Data To File
   
    
}

-(void) onPerformAudioPassThruResponse:(FMCPerformAudioPassThruResponse*) response {
    [self postToConsoleLog:response];
    NSData *dataToWrite = [NSData dataWithData:audioPassThruData];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *savePath = [documentsDirectory stringByAppendingPathComponent:@"Recording.pcm"];
    [dataToWrite writeToFile:savePath atomically:NO];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"PerformAudioPassThruResponse" object:nil];

}

-(void) onOnLanguageChange:(FMCOnLanguageChange*) notification {
    [self postToConsoleLog:notification];
}
-(void) onOnPermissionsChange:(FMCOnPermissionsChange*) notification {
    [self postToConsoleLog:notification];
}
-(void) onOnTBTClientState:(FMCOnTBTClientState*) notification {
	[self postToConsoleLog:notification];
}
-(void) onOnVehicleData:(FMCOnVehicleData*) notification {
    [self postToConsoleLog:notification];
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"DisplayVehicleData" object:nil]];
    
    
}


-(void) onReadDIDResponse:(FMCReadDIDResponse*) response {
    [self postToConsoleLog:response];
}

-(void) onScrollableMessageResponse:(FMCScrollableMessageResponse*) response {
    
    [self alert:[NSString stringWithFormat:@"%@",response]];
    [self postToConsoleLog:response];
}

-(void) onSetDisplayLayoutResponse:(FMCSetDisplayLayoutResponse*) response {
    [self postToConsoleLog:response];
}

-(void) onShowConstantTBTResponse:(FMCShowConstantTBTResponse*) response {
    [self postToConsoleLog:response];
}
-(void) onSliderResponse:(FMCSliderResponse*) response {
    [self postToConsoleLog:response];
}

-(void) onSubscribeVehicleDataResponse:(FMCSubscribeVehicleDataResponse*) response {
    [self postToConsoleLog:response];
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"GetVehicleData" object:nil]];
    
}

-(void) onUnsubscribeVehicleDataResponse:(FMCUnsubscribeVehicleDataResponse*) response {
	[self postToConsoleLog:response];
}
-(void) onUpdateTurnListResponse:(FMCUpdateTurnListResponse*) response {
    [self postToConsoleLog:response];
}

-(void) postToConsoleLog:(id) object {
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"onRPCResponse" object :object]];
}
@end
