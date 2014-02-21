//  FMCTireStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCSingleTireStatus.h>
#import <AppLink/FMCWarningLightStatus.h>

@interface FMCTireStatus : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) FMCWarningLightStatus* pressureTelltale;
@property(assign) FMCSingleTireStatus* leftFront;
@property(assign) FMCSingleTireStatus* rightFront;
@property(assign) FMCSingleTireStatus* leftRear;
@property(assign) FMCSingleTireStatus* rightRear;
@property(assign) FMCSingleTireStatus* innerLeftRear;
@property(assign) FMCSingleTireStatus* innerRightRear;

@end
