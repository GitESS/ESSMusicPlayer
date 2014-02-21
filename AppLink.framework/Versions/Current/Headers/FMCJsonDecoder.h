//  FMCJsonDecoder.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCDecoder.h>

@interface FMCJsonDecoder : NSObject<FMCDecoder> {}

+(NSObject<FMCDecoder>*) instance;

@end
