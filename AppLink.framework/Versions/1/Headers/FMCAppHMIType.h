//  FMCAppHMIType.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCAppHMIType : FMCEnum {}

+(FMCAppHMIType*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCAppHMIType*) DEFAULT;
+(FMCAppHMIType*) COMMUNICATION;
+(FMCAppHMIType*) MEDIA;
+(FMCAppHMIType*) MESSAGING;
+(FMCAppHMIType*) NAVIGATION;
+(FMCAppHMIType*) INFORMATION;
+(FMCAppHMIType*) SOCIAL;
+(FMCAppHMIType*) BACKGROUND_PROCESS;
+(FMCAppHMIType*) TESTING;
+(FMCAppHMIType*) SYSTEM;

@end
