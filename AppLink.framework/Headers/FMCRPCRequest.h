//  FMCRPCRequest.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

@interface FMCRPCRequest : FMCRPCMessage {}

@property(retain) NSNumber* correlationID;

@end
