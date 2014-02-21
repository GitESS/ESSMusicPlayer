//  FMCSoftButton.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCSoftButtonType.h>
#import <AppLink/FMCImage.h>
#import <AppLink/FMCSystemAction.h>

@interface FMCSoftButton : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) FMCSoftButtonType* type;
@property(assign) NSString* text;
@property(assign) FMCImage* image;
@property(assign) NSNumber* isHighlighted;
@property(assign) NSNumber* softButtonID;
@property(assign) FMCSystemAction* systemAction;

@end
