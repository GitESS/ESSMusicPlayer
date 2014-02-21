//  FMCDeviceStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCDeviceLevelStatus.h>
#import <AppLink/FMCPrimaryAudioSource.h>

@interface FMCDeviceStatus : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) NSNumber* voiceRecOn;
@property(assign) NSNumber* btIconOn;
@property(assign) NSNumber* callActive;
@property(assign) NSNumber* phoneRoaming;
@property(assign) NSNumber* textMsgAvailable;
@property(assign) FMCDeviceLevelStatus* battLevelStatus;
@property(assign) NSNumber* stereoAudioOutputMuted;
@property(assign) NSNumber* monoAudioOutputMuted;
@property(assign) FMCDeviceLevelStatus* signalLevelStatus;
@property(assign) FMCPrimaryAudioSource* primaryAudioSource;
@property(assign) NSNumber* eCallEventActive;

@end