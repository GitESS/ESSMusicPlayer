//  FMCOnLanguageChange.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCNotification.h>

#import <AppLink/FMCLanguage.h>

@interface FMCOnLanguageChange : FMCRPCNotification {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) FMCLanguage* language;
@property(assign) FMCLanguage* hmiDisplayLanguage;

@end
