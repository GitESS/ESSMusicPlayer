//  FMCProtocol.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCSyncTransport.h>

#import <AppLink/FMCProtocolListener.h>
#import <AppLink/FMCProtocolMessage.h>

@protocol FMCProtocol<FMCTransportListener>

-(void) handleBytesFromTransport:(Byte*) receivedBytes length:(long) receivedBytesLength;

-(void) sendStartSessionWithType:(FMCSessionType) sessionType;
-(void) sendEndSessionWithType:(FMCSessionType)sessionType sessionID:(Byte)sessionID;
-(void) sendData:(FMCProtocolMessage*) protocolMsg;

@property(assign) NSObject<FMCSyncTransport>* transport;

-(void) addProtocolListener:(NSObject<FMCProtocolListener>*) listener;
-(void) removeProtocolListener:(NSObject<FMCProtocolListener>*) listener;

@end