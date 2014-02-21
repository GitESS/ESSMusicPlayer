//  FMCRegisterAppInterface.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

#import <AppLink/FMCLanguage.h>
#import <AppLink/FMCSyncMsgVersion.h>

@interface FMCRegisterAppInterface : FMCRPCRequest {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) FMCSyncMsgVersion* syncMsgVersion;
@property(assign) NSString* appName;
@property(assign) NSMutableArray* ttsName;
@property(assign) NSString* ngnMediaScreenAppName;
@property(assign) NSMutableArray* vrSynonyms;
@property(assign) NSNumber* isMediaApplication;
@property(assign) FMCLanguage* languageDesired;
@property(assign) FMCLanguage* hmiDisplayLanguageDesired;
@property(assign) NSMutableArray* appHMIType;
@property(assign) NSString* appID;

@end
