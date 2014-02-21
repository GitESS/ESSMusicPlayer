//  FMCFunctionID.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>

@interface FMCFunctionID : NSObject {

    NSDictionary* functionIDs;
}

-(NSString*) getFunctionName:(int) functionID;
-(NSNumber*) getFunctionID:(NSString*) functionName;

@end
