//  FMCRPCMessage.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCRPCStruct : NSObject {
	NSMutableDictionary* store;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict;
-(id) init;

-(NSMutableDictionary*) serializeAsDictionary:(Byte) version;

@end

@interface FMCRPCMessage : FMCRPCStruct {
	NSMutableDictionary* function;
	NSMutableDictionary* parameters;
	NSString* messageType;
	NSData* _bulkData;
}

-(id) initWithName:(NSString*) name;
-(id) initWithDictionary:(NSMutableDictionary*) dict;
-(NSString*) getFunctionName;
-(void) setFunctionName:(NSString*) functionName;
-(NSObject*) getParameters:(NSString*) functionName;
-(void) setParameters:(NSString*) functionName value:(NSObject*) value;
-(NSData*) getBulkData;
-(void) setBulkData:(NSData*) bulkData;

@property(readonly) NSString* name;
@property(readonly) NSString* messageType;

@end