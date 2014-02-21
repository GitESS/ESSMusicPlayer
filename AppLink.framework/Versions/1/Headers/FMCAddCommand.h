//  FMCAddCommand.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

#import <AppLink/FMCImage.h>
#import <AppLink/FMCMenuParams.h>

@interface FMCAddCommand : FMCRPCRequest {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) NSNumber* cmdID;
@property(assign) FMCMenuParams* menuParams;
@property(assign) NSMutableArray* vrCommands;
@property(assign) FMCImage* cmdIcon;

@end
