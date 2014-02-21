//  FMCButtonPressMode.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCButtonPressMode : FMCEnum {}

+(FMCButtonPressMode*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCButtonPressMode*) LONG;
+(FMCButtonPressMode*) SHORT;

@end
