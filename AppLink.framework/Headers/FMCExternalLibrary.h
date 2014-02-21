//  FMCExternalLibrary.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

@protocol FMCExternalLibrary <NSObject>

@required
- (NSString*)getLibraryName;
- (NSString*)getVersion;

@end
