//  FMCVehicleDataStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h> 
#import <AppLink/FMCEnum.h>   

@interface FMCVehicleDataStatus : FMCEnum {}

+(FMCVehicleDataStatus*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCVehicleDataStatus*) NO_DATA_EXISTS;
+(FMCVehicleDataStatus*) OFF;
+(FMCVehicleDataStatus*) ON;

@end