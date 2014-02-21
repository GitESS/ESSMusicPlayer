//  SyncBrain.h
//  AppLinkTester
//  Copyright (c) 2012 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface SyncBrain : NSObject   <FMCProxyListener,FMCTransportListener> {
    FMCSyncProxy* proxy;
    int autoIncCorrID;
    BOOL isLocked;
    BOOL isDD;
    int cmdID;
    BOOL firstTimeStartUp;
    BOOL syncInitialized;
}

@property (strong, nonatomic)NSMutableDictionary * allVoiceCommand;
+(SyncBrain *)sharedInstance;
-(int)  getCMDID;
-(void) setupProxy;
-(void) setup;
-(void) sendRPCMessage:(FMCRPCRequest *)rpcMsg;
-(void) showPressed:(NSString *)message;
-(void) showAdvancedPressedWithLine1Text:(NSString *)line1Text
                                   line2:(NSString *)line2Text
                                   line3:(NSString *)line3Text
                                   line4:(NSString *)line4Text
                               statusBar:(NSString *)statusBar
                              mediaClock:(NSString *)mediaClock
                              mediaTrack:(NSString *)mediaTrack
                               alignment:(FMCTextAlignment *)textAlignment;

-(void) speakPressed:(NSString *)message;
-(void) speakTTSChunksPressed;
-(void) unregisterAppInterfacePressed;
-(void) setMediaClockTimerPressedwithHours:(NSNumber *)hours
                                   minutes:(NSNumber *)minutes
                                   seconds:(NSNumber *)seconds
                                updateMode:(FMCUpdateMode *)updateMode;

-(void) alertPressed:(NSString *)message;
-(void) alertAdvancedPressedwithTTSChunks:(NSArray *)ttsChucks
                               alertText1:(NSString *)alertText1
                               alertText2:(NSString *)alertText2
                               alertText3:(NSString *)alertText3
                                 playTone:(NSNumber *)playTone
                                 duration:(NSNumber *)duration
                              softButtons:(NSArray *)softButtons ;

-(void) addCommand:(NSString *)message;
-(void) addAdvancedCommandPressedwithMenuName:(NSString *)menuName
                                     position:(NSNumber *)position
                                     parentID:(NSNumber *)parentID
                                   vrCommands:(NSArray *)vrCommands
                                    iconValue:(NSString *)iconValue
                                     iconType:(FMCImageType *)iconType;

-(void) deleteCommandPressed:(NSNumber *)cmdID;
-(void) addSubMenuPressedwithID:(NSNumber *)menuID
                       menuName:(NSString *)menuName
                       position:(NSNumber *)position;
-(void) deleteSubMenuPressedwithID:(NSNumber *)menuID;
-(void) createInteractionChoiceSetPressedWithID:(NSNumber *)interactionChoiceSetID
                                      choiceSet:(NSArray *)choices;

-(void) deleteInteractionChoiceSetPressedWithID:(NSNumber *)interactionChoiceSetID;
-(void) performInteractionPressedwithInitialPrompt:(NSArray*)initialChunks
                                       initialText:(NSString*)initialText
                        interactionChoiceSetIDList:(NSArray*)interactionChoiceSetIDList
                                        helpChunks:(NSArray*)helpChunks
                                     timeoutChunks:(NSArray*)timeoutChunks
                                   interactionMode:(FMCInteractionMode*)interactionMode
                                           timeout:(NSNumber*)timeout
                                            vrHelp:(NSArray*)vrHelp ;

-(void) subscribeButtonPressed:(FMCButtonName *)buttonName;
-(void) unsubscribeButtonPressed:(FMCButtonName *)buttonName;
-(void) sendEncodedSyncPData:(NSMutableArray *)data;
-(void) setGlobalPropertiesPressedWithHelpText:(NSString *)helpText
                                   timeoutText:(NSString *)timeoutText;

-(void) resetGlobalPropertiesPressedwithProperties:(NSArray *)properties;
-(void) showPressed:(NSString *)message
     WithSubMessage:(NSString *)subMessage;

-(void) alert:(NSString *)msg;
-(void) initProperties;
-(void) speakStringUsingTTS:(NSString *)stringValue;
-(void) speakStringUsingTTSChunks:(NSArray *)Chunks;
-(void) putFileToSYNC:(NSString *)iconFileName;
-(void) setupAppIcon:(NSString *)iconFileName;
-(void) vehicalDataSubscribe;
-(void) showPressed:(NSString *)msg1
           message2:(NSString *)msg2
           message3:(NSString *)msg3
           message4:(NSString *)msg4;
- (void)scrollableMessagePressedWithScrollableMessageBody:(NSString *)scrollableMessageBody
                                                 timeOut :(NSNumber *)timeOut
                                              softButtons:(NSArray *)softbuttons;

- (void)showPressed2:(NSString *)msg1 message2:(NSString *)msg2 message3:(NSString *)msg3 message4:(NSString *)msg4 count:(int)msgCount;
@end

