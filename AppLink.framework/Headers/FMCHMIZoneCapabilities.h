//  FMCHMIZoneCapabilities.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCHMIZoneCapabilities : FMCEnum {}

+(FMCHMIZoneCapabilities*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCHMIZoneCapabilities*) FRONT;
+(FMCHMIZoneCapabilities*) BACK;

@end
