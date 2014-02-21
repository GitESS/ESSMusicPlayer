//  FMCPutFile.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

#import <AppLink/FMCFileType.h>

@interface FMCPutFile : FMCRPCRequest {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) NSString* syncFileName;
@property(assign) FMCFileType* fileType;
@property(assign) NSNumber* persistentFile;

@end
