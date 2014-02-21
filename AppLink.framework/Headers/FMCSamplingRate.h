//  FMCSamplingRate.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCSamplingRate : FMCEnum {}

+(FMCSamplingRate*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCSamplingRate*) _8KHZ;
+(FMCSamplingRate*) _16KHZ;
+(FMCSamplingRate*) _22KHZ;
+(FMCSamplingRate*) _44KHZ;

@end
