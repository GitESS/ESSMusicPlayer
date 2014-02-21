//  FMCSystemAction.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCSystemAction : FMCEnum {}

+(FMCSystemAction*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCSystemAction*) DEFAULT_ACTION;
+(FMCSystemAction*) STEAL_FOCUS;
+(FMCSystemAction*) KEEP_CONTEXT;

@end
