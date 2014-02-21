//  FMCVehicleDataEventStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h> 
#import <AppLink/FMCEnum.h>   

@interface FMCVehicleDataEventStatus : FMCEnum {}

+(FMCVehicleDataEventStatus*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCVehicleDataEventStatus*) NO_EVENT;
+(FMCVehicleDataEventStatus*) _NO;
+(FMCVehicleDataEventStatus*) _YES;
+(FMCVehicleDataEventStatus*) NOT_SUPPORTED;
+(FMCVehicleDataEventStatus*) FAULT;

@end


