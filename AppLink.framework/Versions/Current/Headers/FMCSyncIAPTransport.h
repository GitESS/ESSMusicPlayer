//  FMCSyncIAPTransport.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCAbstractSyncTransport.h>
#import <ExternalAccessory/ExternalAccessory.h>

@interface FMCSyncIAPTransport : FMCAbstractSyncTransport<NSStreamDelegate> {
	EASession* session;
	NSInputStream* inStream;
	NSOutputStream* outStream;
	NSObject* transportLock;
	
	NSMutableArray* writeQueue;
	
	BOOL spaceAvailable;
	
    BOOL registeredForNotifications;
    BOOL appInBackground;
    BOOL transportUsable;
    
    EAAccessory *connectedSyncAccessory;
}

@property(nonatomic, retain) EASession* session;
@property(nonatomic, retain) NSStream* inStream;
@property(nonatomic, retain) NSStream* outStream;

-(void) checkConnectedSyncAccessory;

@end
