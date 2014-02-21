//  FMCSyncTransport.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCTransportListener.h>

@protocol FMCSyncTransport

@property(assign) int mtuSize;

- (bool) connect;
- (void) disconnect;
- (bool) sendBytes:(NSData*) msg;
- (void) addTransportListener:(NSObject<FMCTransportListener>*) transListener;
- (void) removeTransportListener:(NSObject<FMCTransportListener>*) transListener;

@end
