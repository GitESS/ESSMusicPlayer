//  FMCAbstractProtocol.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCProtocol.h>

#import <AppLink/FMCSyncTransport.h>

@interface FMCAbstractProtocol : NSObject<FMCProtocol> {
	NSObject<FMCSyncTransport>* transport;
	NSMutableArray* protocolListeners;
}

@end
