//  FMCVehicleDataResultCode.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h> 
#import <AppLink/FMCEnum.h>   

@interface FMCVehicleDataResultCode : FMCEnum {}

+(FMCVehicleDataResultCode*) valueOf:(NSString*) value;
+(NSMutableArray*) values;                                 

+(FMCVehicleDataResultCode*) SUCCESS;
+(FMCVehicleDataResultCode*) DISALLOWED;
+(FMCVehicleDataResultCode*) USER_DISALLOWED;
+(FMCVehicleDataResultCode*) INVALID_ID;
+(FMCVehicleDataResultCode*) VEHICLE_DATA_NOT_AVAILABLE;
+(FMCVehicleDataResultCode*) DATA_ALREADY_SUBSCRIBED;
+(FMCVehicleDataResultCode*) DATA_NOT_SUBSCRIBED;
+(FMCVehicleDataResultCode*) IGNORED;

@end


