//  FMCDeviceLevelStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h> 
#import <AppLink/FMCEnum.h>   

@interface FMCDeviceLevelStatus : FMCEnum {}

+(FMCDeviceLevelStatus*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCDeviceLevelStatus*) ZERO_LEVEL_BARS;
+(FMCDeviceLevelStatus*) ONE_LEVEL_BARS;
+(FMCDeviceLevelStatus*) TWO_LEVEL_BARS;
+(FMCDeviceLevelStatus*) THREE_LEVEL_BARS;
+(FMCDeviceLevelStatus*) FOUR_LEVEL_BARS;
+(FMCDeviceLevelStatus*) NOT_PROVIDED;

@end