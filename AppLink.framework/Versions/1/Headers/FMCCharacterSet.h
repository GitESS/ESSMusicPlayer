//  FMCCharacterSet.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCCharacterSet : FMCEnum {}

+(FMCCharacterSet*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCCharacterSet*) TYPE2SET;
+(FMCCharacterSet*) TYPE5SET;
+(FMCCharacterSet*) CID1SET;
+(FMCCharacterSet*) CID2SET;

@end
