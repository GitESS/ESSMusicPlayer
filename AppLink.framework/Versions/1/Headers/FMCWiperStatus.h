//  FMCWiperStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h> 
#import <AppLink/FMCEnum.h>   

@interface FMCWiperStatus : FMCEnum {}

+(FMCWiperStatus*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCWiperStatus*) OFF;
+(FMCWiperStatus*) AUTO_OFF;
+(FMCWiperStatus*) OFF_MOVING;
+(FMCWiperStatus*) MAN_INT_OFF;
+(FMCWiperStatus*) MAN_INT_ON;
+(FMCWiperStatus*) MAN_LOW;
+(FMCWiperStatus*) MAN_HIGH;
+(FMCWiperStatus*) MAN_FLICK;
+(FMCWiperStatus*) WASH;
+(FMCWiperStatus*) AUTO_LOW;
+(FMCWiperStatus*) AUTO_HIGH;
+(FMCWiperStatus*) COURTESYWIPE;
+(FMCWiperStatus*) AUTO_ADJUST;
+(FMCWiperStatus*) STALLED;
+(FMCWiperStatus*) NO_DATA_EXISTS;

@end

