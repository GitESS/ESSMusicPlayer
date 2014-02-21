//  FMCTransportListener.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>

@protocol FMCTransportListener

- (void) onTransportConnected;
- (void) onTransportDisconnected;
- (void) onBytesReceived:(Byte*)bytes length:(long) length;

@end
