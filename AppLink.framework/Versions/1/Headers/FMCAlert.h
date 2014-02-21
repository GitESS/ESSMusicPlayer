//  FMCAlert.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

@interface FMCAlert : FMCRPCRequest {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) NSString* alertText1;
@property(assign) NSString* alertText2;
@property(assign) NSString* alertText3;
@property(assign) NSMutableArray* ttsChunks;
@property(assign) NSNumber* duration;
@property(assign) NSNumber* playTone;
@property(assign) NSMutableArray* softButtons;

@end
