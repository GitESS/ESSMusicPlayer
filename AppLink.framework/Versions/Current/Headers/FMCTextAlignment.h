//  FMCTextAlignment.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCTextAlignment : FMCEnum {}

+(FMCTextAlignment*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCTextAlignment*) LEFT_ALIGNED;
+(FMCTextAlignment*) RIGHT_ALIGNED;
+(FMCTextAlignment*) CENTERED;

@end
