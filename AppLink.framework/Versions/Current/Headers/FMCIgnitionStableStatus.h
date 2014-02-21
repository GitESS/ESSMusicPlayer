//  FMCIgnitionStableStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h> 
#import <AppLink/FMCEnum.h>   

@interface FMCIgnitionStableStatus : FMCEnum {}

+(FMCIgnitionStableStatus*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCIgnitionStableStatus*) IGNITION_SWITCH_NOT_STABLE;
+(FMCIgnitionStableStatus*) IGNITION_SWITCH_STABLE;
+(FMCIgnitionStableStatus*) MISSING_FROM_TRANSMITTER;

@end


