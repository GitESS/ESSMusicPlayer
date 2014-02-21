//  FMCBitsPerSample.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCBitsPerSample : FMCEnum {}

+(FMCBitsPerSample*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCBitsPerSample*) _8_BIT;
+(FMCBitsPerSample*) _16_BIT;

@end
