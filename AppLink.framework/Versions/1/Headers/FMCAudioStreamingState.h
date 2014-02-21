//  FMCAudioStreamingState.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCAudioStreamingState : FMCEnum {}

+(FMCAudioStreamingState*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCAudioStreamingState*) AUDIBLE;
+(FMCAudioStreamingState*) ATTENUATED;
+(FMCAudioStreamingState*) NOT_AUDIBLE;

@end
