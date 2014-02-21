//  FMCSpeechCapabilities.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCSpeechCapabilities : FMCEnum {}

+(FMCSpeechCapabilities*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCSpeechCapabilities*) TEXT;
+(FMCSpeechCapabilities*) SAPI_PHONEMES;
+(FMCSpeechCapabilities*) LHPLUS_PHONEMES;
+(FMCSpeechCapabilities*) PRE_RECORDED;
+(FMCSpeechCapabilities*) SILENCE;

@end
