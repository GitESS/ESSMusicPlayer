//  FMCDimension.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h> 
#import <AppLink/FMCEnum.h>   

@interface FMCDimension : FMCEnum {}

+(FMCDimension*) valueOf:(NSString*) value;
+(NSMutableArray*) values;                                 

+(FMCDimension*) NO_FIX;
+(FMCDimension*) _2D;
+(FMCDimension*) _3D;

@end


