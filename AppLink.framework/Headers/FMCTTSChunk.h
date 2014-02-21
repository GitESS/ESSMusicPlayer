//  FMCTTSChunk.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCSpeechCapabilities.h>

@interface FMCTTSChunk : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) NSString* text;
@property(assign) FMCSpeechCapabilities* type;

@end
