//  FMCDriverDistractionState.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h> 
#import <AppLink/FMCEnum.h>   

@interface FMCDriverDistractionState : FMCEnum {}

+(FMCDriverDistractionState*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCDriverDistractionState*) DD_ON; 
+(FMCDriverDistractionState*) DD_OFF;

@end
