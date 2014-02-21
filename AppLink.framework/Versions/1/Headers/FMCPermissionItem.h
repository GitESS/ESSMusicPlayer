//  FMCPermissionItem.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCHMIPermissions.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCParameterPermissions.h>
#import <AppLink/FMCPermissionStatus.h>

@interface FMCPermissionItem : FMCRPCStruct {}

-(id)init;
-(id)initWithDictionary:(NSMutableDictionary *)dict;

@property(assign) NSString* rpcName;
@property(assign) NSMutableArray* hmiPermissions;
@property(assign) NSMutableArray* parameterPermissions;

@end
