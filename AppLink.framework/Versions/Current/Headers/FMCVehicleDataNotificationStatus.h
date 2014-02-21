//  FMCVehicleDataNotificationStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h> 
#import <AppLink/FMCEnum.h>   

@interface FMCVehicleDataNotificationStatus : FMCEnum {}

+(FMCVehicleDataNotificationStatus*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCVehicleDataNotificationStatus*) NOT_SUPPORTED;
+(FMCVehicleDataNotificationStatus*) NORMAL;
+(FMCVehicleDataNotificationStatus*) ACTIVE;
+(FMCVehicleDataNotificationStatus*) NOT_USED;

@end


