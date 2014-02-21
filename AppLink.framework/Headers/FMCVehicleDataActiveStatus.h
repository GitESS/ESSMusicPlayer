//  FMCVehicleDataActiveStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h> 
#import <AppLink/FMCEnum.h>   

@interface FMCVehicleDataActiveStatus : FMCEnum {}

+(FMCVehicleDataActiveStatus*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCVehicleDataActiveStatus*) INACTIVE_NOT_CONFIRMED;
+(FMCVehicleDataActiveStatus*) INACTIVE_CONFIRMED;
+(FMCVehicleDataActiveStatus*) ACTIVE_NOT_CONFIRMED;
+(FMCVehicleDataActiveStatus*) ACTIVE_CONFIRMED;
+(FMCVehicleDataActiveStatus*) FAULT;

@end


