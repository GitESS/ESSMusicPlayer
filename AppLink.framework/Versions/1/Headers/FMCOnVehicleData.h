//  FMCOnVehicleData.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCNotification.h>

#import <AppLink/FMCBeltStatus.h>
#import <AppLink/FMCBodyInformation.h>
#import <AppLink/FMCComponentVolumeStatus.h>
#import <AppLink/FMCDeviceStatus.h>
#import <AppLink/FMCGPSData.h>
#import <AppLink/FMCHeadLampStatus.h>
#import <AppLink/FMCPRNDL.h>
#import <AppLink/FMCTireStatus.h>
#import <AppLink/FMCVehicleDataEventStatus.h>
#import <AppLink/FMCWiperStatus.h>

@interface FMCOnVehicleData : FMCRPCNotification {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) FMCGPSData* gps;
@property(assign) NSNumber* speed;
@property(assign) NSNumber* rpm;
@property(assign) NSNumber* fuelLevel;
@property(assign) FMCComponentVolumeStatus* fuelLevelState;
@property(assign) NSNumber* instantFuelConsumption;
@property(assign) NSNumber* externalTemperature;
@property(assign) NSString* vin;
@property(assign) FMCPRNDL* prndl;
@property(assign) FMCTireStatus* tirePressure;
@property(assign) NSNumber* odometer;
@property(assign) FMCBeltStatus* beltStatus;
@property(assign) FMCBodyInformation* bodyInformation;
@property(assign) FMCDeviceStatus* deviceStatus;
@property(assign) FMCVehicleDataEventStatus* driverBraking;
@property(assign) FMCWiperStatus* wiperStatus;
@property(assign) FMCHeadLampStatus* headLampStatus;
@property(assign) NSNumber* engineTorque;
@property(assign) NSNumber* accPedalPosition;
@property(assign) NSNumber* steeringWheelAngle;

@end
