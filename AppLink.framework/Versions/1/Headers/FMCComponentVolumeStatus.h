//  FMCComponentVolumeStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h> 
#import <AppLink/FMCEnum.h>   

@interface FMCComponentVolumeStatus : FMCEnum {}

+(FMCComponentVolumeStatus*) valueOf:(NSString*) value;
+(NSMutableArray*) values;                                 

+(FMCComponentVolumeStatus*) UNKNOWN;
+(FMCComponentVolumeStatus*) NORMAL;
+(FMCComponentVolumeStatus*) LOW;
+(FMCComponentVolumeStatus*) FAULT;
+(FMCComponentVolumeStatus*) ALERT;
+(FMCComponentVolumeStatus*) NOT_SUPPORTED;

@end
