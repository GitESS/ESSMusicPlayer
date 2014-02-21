//  FMCSlider.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

@interface FMCSlider : FMCRPCRequest {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) NSNumber* numTicks;
@property(assign) NSNumber* position;
@property(assign) NSString* sliderHeader;
@property(assign) NSMutableArray* sliderFooter;
@property(assign) NSNumber* timeout;

@end
