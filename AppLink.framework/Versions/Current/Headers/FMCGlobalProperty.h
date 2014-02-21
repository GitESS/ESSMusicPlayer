//  FMCGlobalProperty.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCGlobalProperty : FMCEnum {}

+(FMCGlobalProperty*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCGlobalProperty*) HELPPROMPT;
+(FMCGlobalProperty*) TIMEOUTPROMPT;
+(FMCGlobalProperty*) VRHELPTITLE;
+(FMCGlobalProperty*) VRHELPITEMS;

@end
