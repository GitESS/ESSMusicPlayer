//  FMCDecoder.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>

@protocol FMCDecoder

-(NSDictionary*) decode:(NSData*) msgBytes;

@end
