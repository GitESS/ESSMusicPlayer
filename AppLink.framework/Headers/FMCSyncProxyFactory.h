//  FMCSyncProxyFactory.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCSyncProxy.h>

@interface FMCSyncProxyFactory : NSObject {}

+(FMCSyncProxy*) buildSyncProxyWithListener:(NSObject<FMCProxyListener>*) listener;
+(FMCSyncProxy*) buildSyncProxyWithListener:(NSObject<FMCProxyListener>*) listener
                              tcpIPAddress: (NSString*) ipaddress
                                   tcpPort: (NSString*) port;
@end
