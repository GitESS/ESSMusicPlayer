//  FMCPrimaryAudioSource.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h> 
#import <AppLink/FMCEnum.h>   

@interface FMCPrimaryAudioSource : FMCEnum {}

+(FMCPrimaryAudioSource*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCPrimaryAudioSource*) NO_SOURCE_SELECTED;
+(FMCPrimaryAudioSource*) USB;
+(FMCPrimaryAudioSource*) USB2;
+(FMCPrimaryAudioSource*) BLUETOOTH_STEREO_BTST;
+(FMCPrimaryAudioSource*) LINE_IN;
+(FMCPrimaryAudioSource*) IPOD;
+(FMCPrimaryAudioSource*) MOBILE_APP;

@end


