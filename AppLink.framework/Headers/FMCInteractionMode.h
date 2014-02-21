//  FMCInteractionMode.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCInteractionMode : FMCEnum {}

+(FMCInteractionMode*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCInteractionMode*) MANUAL_ONLY;
+(FMCInteractionMode*) VR_ONLY;
+(FMCInteractionMode*) BOTH;

@end
