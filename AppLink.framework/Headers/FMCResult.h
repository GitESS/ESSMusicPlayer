//  FMCResult.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCResult : FMCEnum {}

+(FMCResult*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCResult*) SUCCESS;
+(FMCResult*) INVALID_DATA;
+(FMCResult*) UNSUPPORTED_REQUEST;
+(FMCResult*) OUT_OF_MEMORY;
+(FMCResult*) TOO_MANY_PENDING_REQUESTS;
+(FMCResult*) INVALID_ID;
+(FMCResult*) DUPLICATE_NAME;
+(FMCResult*) TOO_MANY_APPLICATIONS;
+(FMCResult*) APPLICATION_REGISTERED_ALREADY;
+(FMCResult*) UNSUPPORTED_VERSION;
+(FMCResult*) WRONG_LANGUAGE;
+(FMCResult*) APPLICATION_NOT_REGISTERED;
+(FMCResult*) IN_USE;
+(FMCResult*) VEHICLE_DATA_NOT_ALLOWED;
+(FMCResult*) VEHICLE_DATA_NOT_AVAILABLE;
+(FMCResult*) REJECTED;
+(FMCResult*) ABORTED;
+(FMCResult*) IGNORED;
+(FMCResult*) UNSUPPORTED_RESOURCE;
+(FMCResult*) FILE_NOT_FOUND;
+(FMCResult*) GENERIC_ERROR;
+(FMCResult*) DISALLOWED;
+(FMCResult*) USER_DISALLOWED;
+(FMCResult*) TIMED_OUT;
+(FMCResult*) CANCEL_ROUTE;
+(FMCResult*) TRUNCATED_DATA;
+(FMCResult*) RETRY;
+(FMCResult*) WARNINGS;

@end
