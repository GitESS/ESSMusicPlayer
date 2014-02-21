//  FMCTextField.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCCharacterSet.h>
#import <AppLink/FMCTextFieldName.h>

@interface FMCTextField : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) FMCTextFieldName* name;
@property(assign) FMCCharacterSet* characterSet;
@property(assign) NSNumber* width;
@property(assign) NSNumber* rows;

@end
