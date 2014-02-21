//  FMCMediaClockFormat.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCMediaClockFormat : FMCEnum {}

+(FMCMediaClockFormat*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCMediaClockFormat*) CLOCK1;
+(FMCMediaClockFormat*) CLOCK2;
+(FMCMediaClockFormat*) CLOCK3;
+(FMCMediaClockFormat*) CLOCKTEXT1;
+(FMCMediaClockFormat*) CLOCKTEXT2;
+(FMCMediaClockFormat*) CLOCKTEXT3;
+(FMCMediaClockFormat*) CLOCKTEXT4;

@end
