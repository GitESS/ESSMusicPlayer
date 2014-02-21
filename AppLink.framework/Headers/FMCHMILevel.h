//  FMCHMILevel.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCHMILevel : FMCEnum {}

+(FMCHMILevel*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCHMILevel*) HMI_FULL;
+(FMCHMILevel*) HMI_LIMITED;
+(FMCHMILevel*) HMI_BACKGROUND;
+(FMCHMILevel*) HMI_NONE;

@end
