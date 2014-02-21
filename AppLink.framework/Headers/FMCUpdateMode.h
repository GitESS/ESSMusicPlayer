//  FMCUpdateMode.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCUpdateMode : FMCEnum {}

+(FMCUpdateMode*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCUpdateMode*) COUNTUP;
+(FMCUpdateMode*) COUNTDOWN;
+(FMCUpdateMode*) PAUSE;
+(FMCUpdateMode*) RESUME;
+(FMCUpdateMode*) CLEAR;


@end
