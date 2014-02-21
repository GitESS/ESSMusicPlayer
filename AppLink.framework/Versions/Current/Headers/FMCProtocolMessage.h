//  FMCProtocolMessage.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCProtocolFrameHeader.h>

typedef enum FMCMessageType {
	FMCMessageType_UNDEFINED = 0x01,
	FMCMessageType_BULK = 0x02,
	FMCMessageType_RPC = 0x03
} FMCMessageType;

@interface FMCProtocolMessage : NSObject {
    Byte _version;
	FMCSessionType _sessionType;
	FMCMessageType _messageType;
	Byte _sessionID;
    Byte _rpcType;
    UInt32 _functionID;
    UInt32 _correlationID;
    UInt32 _jsonSize;
	
	NSData* _data;
	NSData* _bulkData;
}

@property(assign) Byte _version;
@property(assign) FMCSessionType _sessionType;
@property(assign) FMCMessageType _messageType;
@property(assign) Byte _sessionID;
@property(assign) Byte _rpcType;
@property(assign) UInt32 _functionID;
@property(assign) UInt32 _correlationID;
@property(assign) UInt32 _jsonSize;

@property(retain) NSData* _data;
@property(retain) NSData* _bulkData;

@end