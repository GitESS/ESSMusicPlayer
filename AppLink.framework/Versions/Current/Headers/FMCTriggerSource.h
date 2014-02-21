//  FMCTriggerSource.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCTriggerSource : FMCEnum {}

+(FMCTriggerSource*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCTriggerSource*) TS_MENU;
+(FMCTriggerSource*) TS_VR;

@end
