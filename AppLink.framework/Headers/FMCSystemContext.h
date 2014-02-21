//  FMCSystemContext.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCSystemContext : FMCEnum {}

+(FMCSystemContext*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCSystemContext*) MAIN;
+(FMCSystemContext*) VRSESSION;
+(FMCSystemContext*) MENU;
+(FMCSystemContext*) HMI_OBSCURED;
+(FMCSystemContext*) ALERT;

@end
