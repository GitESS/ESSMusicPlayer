//  FMCBitConverter.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>

@interface FMCBitConverter : NSObject{}

+(NSData*) intToByteArray:(UInt32) value;
+(UInt32) intFromByteArray:(Byte*) sizeBuf offset:(UInt32) offset;

@end
