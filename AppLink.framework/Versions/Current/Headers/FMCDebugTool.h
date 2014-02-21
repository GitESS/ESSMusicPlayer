//  FMCDebugTool.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>

@protocol FMCDebugToolConsole

-(void) logInfo:(NSString*) info;
-(void) logException:(NSException*) ex withMessage:(NSString*) message;

@end

@interface FMCDebugTool : NSObject {}

+(void) addConsole:(NSObject<FMCDebugToolConsole>*) aConsole;
+(void) removeConsole:(NSObject<FMCDebugToolConsole>*) aConsole;
+(void) logInfo:(NSString*) fmt, ... ;
+(void) logException:(NSException*) ex withMessage:(NSString*) fmt, ... ;

@end
