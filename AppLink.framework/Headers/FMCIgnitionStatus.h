//  FMCIgnitionStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h> 
#import <AppLink/FMCEnum.h>   

@interface FMCIgnitionStatus : FMCEnum {}

+(FMCIgnitionStatus*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCIgnitionStatus*) UNKNOWN;
+(FMCIgnitionStatus*) OFF;
+(FMCIgnitionStatus*) ACCESSORY;
+(FMCIgnitionStatus*) RUN;
+(FMCIgnitionStatus*) START;
+(FMCIgnitionStatus*) INVALID;

@end


