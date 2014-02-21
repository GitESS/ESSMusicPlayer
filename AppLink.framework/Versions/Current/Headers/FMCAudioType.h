//  FMCAudioType.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCAudioType : FMCEnum {}

+(FMCAudioType*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCAudioType*) PCM;

@end
