//  FMCEngineInfo.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCMaintenanceModeStatus.h>

@interface FMCEngineInfo : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) NSNumber* electricFuelConsumption;
@property(assign) NSNumber* stateOfCharge;
@property(assign) FMCMaintenanceModeStatus* fuelMaintenanceMode;
@property(assign) NSNumber* distanceToEmpty;

@end
