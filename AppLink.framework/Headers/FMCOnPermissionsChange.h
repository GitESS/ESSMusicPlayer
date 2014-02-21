//  FMCOnPermissionsChange.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCPermissionItem.h>
#import <AppLink/FMCRPCNotification.h>

@interface FMCOnPermissionsChange : FMCRPCNotification

-(id)init;
-(id)initWithDictionary:(NSMutableDictionary *)dict;

@property(assign) NSMutableArray* permissionItem;

@end
