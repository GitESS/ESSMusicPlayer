//  FMCOnButtonPress.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCNotification.h>

#import <AppLink/FMCButtonName.h>
#import <AppLink/FMCButtonPressMode.h>

@interface FMCOnButtonPress : FMCRPCNotification {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) FMCButtonName* buttonName;
@property(assign) FMCButtonPressMode* buttonPressMode;
@property(assign) NSNumber* customButtonID;

@end
