//  FMCVehicleDataType.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h> 
#import <AppLink/FMCEnum.h>   

@interface FMCVehicleDataType : FMCEnum {}

+(FMCVehicleDataType*) valueOf:(NSString*) value;
+(NSMutableArray*) values;                                 

+(FMCVehicleDataType*) VEHICLEDATA_GPS;
+(FMCVehicleDataType*) VEHICLEDATA_SPEED;
+(FMCVehicleDataType*) VEHICLEDATA_RPM;
+(FMCVehicleDataType*) VEHICLEDATA_FUELLEVEL;
+(FMCVehicleDataType*) VEHICLEDATA_FUELLEVEL_STATE;
+(FMCVehicleDataType*) VEHICLEDATA_FUELCONSUMPTION;
+(FMCVehicleDataType*) VEHICLEDATA_EXTERNTEMP;
+(FMCVehicleDataType*) VEHICLEDATA_VIN;
+(FMCVehicleDataType*) VEHICLEDATA_PRNDL;
+(FMCVehicleDataType*) VEHICLEDATA_TIREPRESSURE;
+(FMCVehicleDataType*) VEHICLEDATA_ODOMETER;
+(FMCVehicleDataType*) VEHICLEDATA_BELTSTATUS;
+(FMCVehicleDataType*) VEHICLEDATA_BODYINFO;
+(FMCVehicleDataType*) VEHICLEDATA_DEVICESTATUS;
+(FMCVehicleDataType*) VEHICLEDATA_BRAKING;
+(FMCVehicleDataType*) VEHICLEDATA_WIPERSTATUS;
+(FMCVehicleDataType*) VEHICLEDATA_HEADLAMPSTATUS;
+(FMCVehicleDataType*) VEHICLEDATA_BATTVOLTAGE;
+(FMCVehicleDataType*) VEHICLEDATA_ENGINETORQUE;
+(FMCVehicleDataType*) VEHICLEDATA_ACCPEDAL;
+(FMCVehicleDataType*) VEHICLEDATA_STEERINGWHEEL;

@end


