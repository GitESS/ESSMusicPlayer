//  FMCScrollableMessage.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

@interface FMCScrollableMessage : FMCRPCRequest {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) NSString* scrollableMessageBody;
@property(assign) NSNumber* timeout;
@property(assign) NSMutableArray* softButtons;

@end
