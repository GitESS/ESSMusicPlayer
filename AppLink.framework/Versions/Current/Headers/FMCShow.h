//  FMCShow.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

#import <AppLink/FMCImage.h>
#import <AppLink/FMCSoftButton.h>
#import <AppLink/FMCTextAlignment.h>

@interface FMCShow : FMCRPCRequest {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) NSString* mainField1;
@property(assign) NSString* mainField2;
@property(assign) NSString* mainField3;
@property(assign) NSString* mainField4;
@property(assign) FMCTextAlignment* alignment;
@property(assign) NSString* statusBar;
@property(assign) NSString* mediaClock;
@property(assign) NSString* mediaTrack;
@property(assign) FMCImage* graphic;
@property(assign) NSMutableArray* softButtons;
@property(assign) NSMutableArray* customPresets;

@end
