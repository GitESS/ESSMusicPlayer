//  FMCAppInterfaceUnregisteredReason.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCAppInterfaceUnregisteredReason : FMCEnum {}

+(FMCAppInterfaceUnregisteredReason*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCAppInterfaceUnregisteredReason*) USER_EXIT;
+(FMCAppInterfaceUnregisteredReason*) IGNITION_OFF;
+(FMCAppInterfaceUnregisteredReason*) BLUETOOTH_OFF;
+(FMCAppInterfaceUnregisteredReason*) USB_DISCONNECTED;
+(FMCAppInterfaceUnregisteredReason*) REQUEST_WHILE_IN_NONE_HMI_LEVEL;
+(FMCAppInterfaceUnregisteredReason*) TOO_MANY_REQUESTS;
+(FMCAppInterfaceUnregisteredReason*) DRIVER_DISTRACTION_VIOLATION;
+(FMCAppInterfaceUnregisteredReason*) MASTER_RESET;
+(FMCAppInterfaceUnregisteredReason*) FACTORY_DEFAULTS;
+(FMCAppInterfaceUnregisteredReason*) APP_UNAUTHORIZED;

@end
