//  FMCOnAppInterfaceUnregistered.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCNotification.h>

#import <AppLink/FMCAppInterfaceUnregisteredReason.h>

@interface FMCOnAppInterfaceUnregistered : FMCRPCNotification {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) FMCAppInterfaceUnregisteredReason* reason;

@end
