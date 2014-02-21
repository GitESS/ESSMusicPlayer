//  FMCProtocolFrameHeaderFactory.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>

#import <AppLink/FMCProtocolFrameHeader.h>

@interface FMCProtocolFrameHeaderFactory : NSObject {}

+(FMCProtocolFrameHeader*) parseHeader:(NSData*) header;
+(FMCProtocolFrameHeader*) startSessionWithSessionType:(FMCSessionType)sessionType messageID:(UInt32)messageID version:(Byte)version;
+(FMCProtocolFrameHeader*) endSessionWithSessionType:(FMCSessionType)sessionType sessionID:(Byte)sessionID messageID:(UInt32)messageID version:(Byte)version;
+(FMCProtocolFrameHeader*) singleFrameWithSessionType:(FMCSessionType)sessionType sessionID:(Byte)sessionID dataSize:(NSInteger)dataSize messageID:(UInt32)messageID version:(Byte)version;
+(FMCProtocolFrameHeader*) firstFrameWithSessionType:(FMCSessionType)sessionType sessionID:(Byte)sessionID messageID:(UInt32)messageID version:(Byte)version;
+(FMCProtocolFrameHeader*) consecutiveFrameWithSessionType:(FMCSessionType) sessionType sessionID:(Byte)sessionID dataSize:(NSInteger)dataSize messageID:(UInt32)messageID version:(Byte)version;

@end
