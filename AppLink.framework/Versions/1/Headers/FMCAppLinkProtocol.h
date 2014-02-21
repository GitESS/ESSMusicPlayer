//  FMCAppLinkProtocol.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCAbstractProtocol.h>

@interface FMCAppLinkProtocol : FMCAbstractProtocol {
    int headerSize;
    Byte _version;
	BOOL haveHeader;
	NSMutableData* headerBuf;
	NSMutableData* dataBuf;
	FMCProtocolFrameHeader* currentHeader;
	NSMutableDictionary *frameAssemblerForSessionID;
	NSInteger dataBufFinalLength;
	NSObject *msgLock;
    UInt32 _messageID;
}

-(void) setVersion:(Byte) version;
-(void) resetHeaderAndData;

@end

@interface FrameAssembler : NSObject {
    Byte _version;
	BOOL hasFirstFrame;
	BOOL hasSecondFrame;
	NSMutableData *accumulator;
	NSInteger totalSize;
	NSInteger framesRemaining;
	NSArray* listeners;
    UInt32 _hashID;
}
	
-(id) initWithListeners:(NSArray*)listeners;
-(void) handleFirstFrame:(FMCProtocolFrameHeader*) header data:(NSData*) data;
-(void) handleSecondFrame:(FMCProtocolFrameHeader*) header data:(NSData*) data;
-(void) handleRemainingFrame:(FMCProtocolFrameHeader*) header data:(NSData*) data;
-(void) notifyIfFinished:(FMCProtocolFrameHeader*) header;
-(void) handleMultiFrame:(FMCProtocolFrameHeader*) header data:(NSData*) data;
-(void) handleFrame:(FMCProtocolFrameHeader*) header data:(NSData*) data;	
	
@end

@interface BulkAssembler: FrameAssembler {
	
	NSInteger bulkCorrId;
}

@end