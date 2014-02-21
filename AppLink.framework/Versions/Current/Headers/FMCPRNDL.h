//  FMCPRNDL.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h> 
#import <AppLink/FMCEnum.h>   

@interface FMCPRNDL : FMCEnum {}

+(FMCPRNDL*) valueOf:(NSString*) value;
+(NSMutableArray*) values;                                 

+(FMCPRNDL*) PARK;
+(FMCPRNDL*) REVERSE;
+(FMCPRNDL*) NEUTRAL;
+(FMCPRNDL*) DRIVE;
+(FMCPRNDL*) SPORT;
+(FMCPRNDL*) LOWGEAR;
+(FMCPRNDL*) FIRST;
+(FMCPRNDL*) SECOND;
+(FMCPRNDL*) THIRD;
+(FMCPRNDL*) FOURTH;
+(FMCPRNDL*) FIFTH;
+(FMCPRNDL*) SIXTH;
+(FMCPRNDL*) SEVENTH;
+(FMCPRNDL*) EIGTH;
+(FMCPRNDL*) UNKNOWN;
+(FMCPRNDL*) FAULT;

@end


