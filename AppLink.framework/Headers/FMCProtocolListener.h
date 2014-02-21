//  FMCProtocolListener.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCProtocolMessage.h>

@protocol FMCProtocolListener

-(void) handleProtocolSessionStarted:(FMCSessionType) sessionType sessionID:(Byte) sessionID version:(Byte) version;
-(void) onProtocolMessageReceived:(FMCProtocolMessage*) msg;

-(void) onProtocolOpened;
-(void) onProtocolClosed;
-(void) onError:(NSString*) info exception:(NSException*) e;

@end

