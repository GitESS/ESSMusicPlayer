//  FMCFileType.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCFileType : FMCEnum {}

+(FMCFileType*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCFileType*) GRAPHIC_BMP;
+(FMCFileType*) GRAPHIC_JPEG;
+(FMCFileType*) GRAPHIC_PNG;
+(FMCFileType*) AUDIO_WAVE;
+(FMCFileType*) AUDIO_MP3;
+(FMCFileType*) BINARY;

@end