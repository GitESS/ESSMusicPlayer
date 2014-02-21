//  FMCVrCapabilities.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCVrCapabilities : FMCEnum {}

+(FMCVrCapabilities*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCVrCapabilities*) TEXT;

@end
