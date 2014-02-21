//  FMCSoftButtonType.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCSoftButtonType : FMCEnum {}

+(FMCSoftButtonType*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCSoftButtonType*) TEXT;
+(FMCSoftButtonType*) IMAGE;
+(FMCSoftButtonType*) BOTH;

@end
