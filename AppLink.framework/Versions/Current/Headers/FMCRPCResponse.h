//  FMCRPCResponse.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCResult.h>

@interface FMCRPCResponse : FMCRPCMessage {}

@property(retain) NSNumber* correlationID;

@property(retain) NSNumber* success;
@property(assign) FMCResult* resultCode;
@property(retain) NSString* info;

@end
