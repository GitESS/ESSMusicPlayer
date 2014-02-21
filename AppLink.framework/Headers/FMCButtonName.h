//  FMCButtonName.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCButtonName : FMCEnum {}

+(FMCButtonName*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCButtonName*) OK;
+(FMCButtonName*) SEEKLEFT;
+(FMCButtonName*) SEEKRIGHT;
+(FMCButtonName*) TUNEUP;
+(FMCButtonName*) TUNEDOWN;
+(FMCButtonName*) PRESET_0;
+(FMCButtonName*) PRESET_1;
+(FMCButtonName*) PRESET_2;
+(FMCButtonName*) PRESET_3;
+(FMCButtonName*) PRESET_4;
+(FMCButtonName*) PRESET_5;
+(FMCButtonName*) PRESET_6;
+(FMCButtonName*) PRESET_7;
+(FMCButtonName*) PRESET_8;
+(FMCButtonName*) PRESET_9;
+(FMCButtonName*) CUSTOM_BUTTON;

@end
