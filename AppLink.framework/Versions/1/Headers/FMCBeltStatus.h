//  FMCBeltStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCVehicleDataEventStatus.h>

@interface FMCBeltStatus : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) FMCVehicleDataEventStatus* driverBeltDeployed;
@property(assign) FMCVehicleDataEventStatus* passengerBeltDeployed;
@property(assign) FMCVehicleDataEventStatus* passengerBuckleBelted;
@property(assign) FMCVehicleDataEventStatus* driverBuckleBelted;
@property(assign) FMCVehicleDataEventStatus* leftRow2BuckleBelted;
@property(assign) FMCVehicleDataEventStatus* passengerChildDetected;
@property(assign) FMCVehicleDataEventStatus* rightRow2BuckleBelted;
@property(assign) FMCVehicleDataEventStatus* middleRow2BuckleBelted;
@property(assign) FMCVehicleDataEventStatus* middleRow3BuckleBelted;
@property(assign) FMCVehicleDataEventStatus* leftRow3BuckledBelted;
@property(assign) FMCVehicleDataEventStatus* rightRow3BuckleBelted;
@property(assign) FMCVehicleDataEventStatus* leftRearInflatableBelted;
@property(assign) FMCVehicleDataEventStatus* rightRearInflatableBelted;
@property(assign) FMCVehicleDataEventStatus* middleRow1BeltDeployed;
@property(assign) FMCVehicleDataEventStatus* middleRow1BuckleBelted;

@end
