//  FMCTTSChunkFactory.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>

#import <AppLink/FMCJingle.h>
#import <AppLink/FMCTTSChunk.h>

@interface FMCTTSChunkFactory : NSObject {}

+(FMCTTSChunk*) buildTTSChunkForString:(NSString*) text type:(FMCSpeechCapabilities*)type;
+(NSMutableArray*) buildTTSChunksFromSimple:(NSString*) simple;

@end
