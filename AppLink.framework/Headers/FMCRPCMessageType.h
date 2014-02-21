//  FMCRPCMessageType.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCRPCMessageType : FMCEnum {}

+(FMCRPCMessageType*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCRPCMessageType*) request;
+(FMCRPCMessageType*) response;
+(FMCRPCMessageType*) notification;

@end
