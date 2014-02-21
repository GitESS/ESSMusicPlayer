//  FMCGPSData.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCCompassDirection.h>
#import <AppLink/FMCDimension.h>

@interface FMCGPSData : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) NSNumber* longitudeDegrees;
@property(assign) NSNumber* latitudeDegrees;
@property(assign) NSNumber* utcYear;
@property(assign) NSNumber* utcMonth;
@property(assign) NSNumber* utcDay;
@property(assign) NSNumber* utcHours;
@property(assign) NSNumber* utcMinutes;
@property(assign) NSNumber* utcSeconds;
@property(assign) FMCCompassDirection* compassDirection;
@property(assign) NSNumber* pdop;
@property(assign) NSNumber* hdop;
@property(assign) NSNumber* vdop;
@property(assign) NSNumber* actual;
@property(assign) NSNumber* satellites;
@property(assign) FMCDimension* dimension;
@property(assign) NSNumber* altitude;
@property(assign) NSNumber* heading;
@property(assign) NSNumber* speed;

@end
