//  FMCAudioPassThruCapabilities.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCAudioType.h>
#import <AppLink/FMCBitsPerSample.h>
#import <AppLink/FMCSamplingRate.h>

@interface FMCAudioPassThruCapabilities : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) FMCSamplingRate* samplingRate;
@property(assign) FMCBitsPerSample* bitsPerSample;
@property(assign) FMCAudioType* audioType;

@end
