//  FMCWarningLightStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h> 
#import <AppLink/FMCEnum.h>   

@interface FMCWarningLightStatus : FMCEnum {}

+(FMCWarningLightStatus*) valueOf:(NSString*) value;
+(NSMutableArray*) values;                                 

+(FMCWarningLightStatus*) OFF;
+(FMCWarningLightStatus*) ON;
+(FMCWarningLightStatus*) FLASH;
+(FMCWarningLightStatus*) NOT_USED;

@end


