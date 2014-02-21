//  FMCTextFieldName.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCTextFieldName : FMCEnum {}

+(FMCTextFieldName*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCTextFieldName*) mainField1;
+(FMCTextFieldName*) mainField2;
+(FMCTextFieldName*) mainField3;
+(FMCTextFieldName*) mainField4;
+(FMCTextFieldName*) statusBar;
+(FMCTextFieldName*) mediaClock;
+(FMCTextFieldName*) mediaTrack;
+(FMCTextFieldName*) alertText1;
+(FMCTextFieldName*) alertText2;
+(FMCTextFieldName*) alertText3;
+(FMCTextFieldName*) scrollableMessageBody;
+(FMCTextFieldName*) initialInteractionText;
+(FMCTextFieldName*) navigationText1;
+(FMCTextFieldName*) navigationText2;
+(FMCTextFieldName*) ETA;
+(FMCTextFieldName*) totalDistance;
+(FMCTextFieldName*) audioPassThruDisplayText1;
+(FMCTextFieldName*) audioPassThruDisplayText2;
+(FMCTextFieldName*) sliderHeader;
+(FMCTextFieldName*) sliderFooter;

@end
