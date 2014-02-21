//  FMCDisplayCapabilities.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCDisplayType.h>

@interface FMCDisplayCapabilities : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) FMCDisplayType* displayType;
@property(assign) NSMutableArray* textFields;
@property(assign) NSMutableArray* mediaClockFormats;
@property(assign) NSNumber* graphicSupported;

@end
