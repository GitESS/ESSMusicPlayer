//  FMCPerformAudioPassThru.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

#import <AppLink/FMCAudioType.h>
#import <AppLink/FMCBitsPerSample.h>
#import <AppLink/FMCSamplingRate.h>

@interface FMCPerformAudioPassThru : FMCRPCRequest {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) NSMutableArray* initialPrompt;
@property(assign) NSString* audioPassThruDisplayText1;
@property(assign) NSString* audioPassThruDisplayText2;
@property(assign) FMCSamplingRate* samplingRate;
@property(assign) NSNumber* maxDuration;
@property(assign) FMCBitsPerSample* bitsPerSample;
@property(assign) FMCAudioType* audioType;
@property(assign) NSNumber* muteAudio;

@end