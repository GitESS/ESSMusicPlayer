//  FMCImageType.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCImageType : FMCEnum {}

+(FMCImageType*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCImageType*) STATIC;
+(FMCImageType*) DYNAMIC;

@end
