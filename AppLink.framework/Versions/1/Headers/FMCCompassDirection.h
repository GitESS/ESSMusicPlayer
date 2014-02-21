//  FMCCompassDirection.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h> 
#import <AppLink/FMCEnum.h>   

@interface FMCCompassDirection : FMCEnum {}

+(FMCCompassDirection*) valueOf:(NSString*) value;
+(NSMutableArray*) values;                                 

+(FMCCompassDirection*) NORTH;
+(FMCCompassDirection*) NORTHWEST;
+(FMCCompassDirection*) WEST;
+(FMCCompassDirection*) SOUTHWEST;
+(FMCCompassDirection*) SOUTH;
+(FMCCompassDirection*) SOUTHEAST;
+(FMCCompassDirection*) EAST;
+(FMCCompassDirection*) NORTHEAST;

@end
