//  FMCVehicleDataResult.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCVehicleDataType.h>
#import <AppLink/FMCVehicleDataResultCode.h>

@interface FMCVehicleDataResult : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) FMCVehicleDataType* dataType;
@property(assign) FMCVehicleDataResultCode* resultCode;

@end
