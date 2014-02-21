//  FMCOnButtonEvent.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCNotification.h>

#import <AppLink/FMCButtonEventMode.h>
#import <AppLink/FMCButtonName.h>

@interface FMCOnButtonEvent : FMCRPCNotification {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) FMCButtonName* buttonName;
@property(assign) FMCButtonEventMode* buttonEventMode;
@property(assign) NSNumber* customButtonID;

@end
