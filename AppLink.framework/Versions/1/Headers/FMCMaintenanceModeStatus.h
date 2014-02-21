//  FMCMaintenanceModeStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h> 
#import <AppLink/FMCEnum.h>   

@interface FMCMaintenanceModeStatus : FMCEnum {}

+(FMCMaintenanceModeStatus*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCMaintenanceModeStatus*) NORMAL;
+(FMCMaintenanceModeStatus*) NEAR;
+(FMCMaintenanceModeStatus*) ACTIVE;
+(FMCMaintenanceModeStatus*) FEATURE_NOT_PRESENT;

@end


