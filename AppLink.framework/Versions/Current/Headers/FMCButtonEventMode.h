//  FMCButtonEventMode.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCButtonEventMode : FMCEnum {}

+(FMCButtonEventMode*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCButtonEventMode*) BUTTONUP;
+(FMCButtonEventMode*) BUTTONDOWN;

@end
