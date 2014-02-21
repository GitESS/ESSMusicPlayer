//  FMCPermissionStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCEnum.h>

@interface FMCPermissionStatus : FMCEnum {}

+(FMCPermissionStatus*) valueOf:(NSString*) value;
+(NSMutableArray*) values;                                

+(FMCPermissionStatus*) ALLOWED; 
+(FMCPermissionStatus*) DISALLOWED;
+(FMCPermissionStatus*) USER_DISALLOWED; 
+(FMCPermissionStatus*) USER_CONSENT_PENDING;

@end
