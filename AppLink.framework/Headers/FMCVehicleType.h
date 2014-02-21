//  FMCVehicleType.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

@interface FMCVehicleType : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) NSString* make;
@property(assign) NSString* model;
@property(assign) NSString* modelYear;
@property(assign) NSString* trim;

@end
