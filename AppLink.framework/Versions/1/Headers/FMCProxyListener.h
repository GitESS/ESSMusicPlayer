//  FMCProxyListener.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCAddCommandResponse.h>
#import <AppLink/FMCAddSubMenuResponse.h>
#import <AppLink/FMCAlertResponse.h>
#import <AppLink/FMCChangeRegistrationResponse.h>
#import <AppLink/FMCCreateInteractionChoiceSetResponse.h>
#import <AppLink/FMCDeleteCommandResponse.h>
#import <AppLink/FMCDeleteFileResponse.h>
#import <AppLink/FMCDeleteInteractionChoiceSetResponse.h>
#import <AppLink/FMCDeleteSubMenuResponse.h>
#import <AppLink/FMCEndAudioPassThruResponse.h>
#import <AppLink/FMCGenericResponse.h>
#import <AppLink/FMCGetDTCsResponse.h>
#import <AppLink/FMCGetVehicleDataResponse.h>
#import <AppLink/FMCListFilesResponse.h>
#import <AppLink/FMCOnAppInterfaceUnregistered.h>
#import <AppLink/FMCOnAudioPassThru.h>
#import <AppLink/FMCOnButtonEvent.h>
#import <AppLink/FMCOnButtonPress.h>
#import <AppLink/FMCOnCommand.h>
#import <AppLink/FMCOnDriverDistraction.h>
#import <AppLink/FMCOnHMIStatus.h>
#import <AppLink/FMCOnLanguageChange.h>
#import <AppLink/FMCOnPermissionsChange.h>
#import <AppLink/FMCOnVehicleData.h>
#import <AppLink/FMCPerformAudioPassThruResponse.h>
#import <AppLink/FMCPerformInteractionResponse.h>
#import <AppLink/FMCPutFileResponse.h>
#import <AppLink/FMCReadDIDResponse.h>
#import <AppLink/FMCRegisterAppInterfaceResponse.h>
#import <AppLink/FMCResetGlobalPropertiesResponse.h>
#import <AppLink/FMCScrollableMessageResponse.h>
#import <AppLink/FMCSetAppIconResponse.h>
#import <AppLink/FMCSetDisplayLayoutResponse.h>
#import <AppLink/FMCSetGlobalPropertiesResponse.h>
#import <AppLink/FMCSetMediaClockTimerResponse.h>
#import <AppLink/FMCShowResponse.h>
#import <AppLink/FMCSliderResponse.h>
#import <AppLink/FMCSpeakResponse.h>
#import <AppLink/FMCSubscribeButtonResponse.h>
#import <AppLink/FMCSubscribeVehicleDataResponse.h>
#import <AppLink/FMCUnregisterAppInterfaceResponse.h>
#import <AppLink/FMCUnsubscribeButtonResponse.h>
#import <AppLink/FMCUnsubscribeVehicleDataResponse.h>

@protocol FMCProxyListener

-(void) onOnDriverDistraction:(FMCOnDriverDistraction*) notification;
-(void) onOnHMIStatus:(FMCOnHMIStatus*) notification;
-(void) onProxyClosed;
-(void) onProxyOpened;

@optional

-(void) onAddCommandResponse:(FMCAddCommandResponse*) response;
-(void) onAddSubMenuResponse:(FMCAddSubMenuResponse*) response;
-(void) onAlertResponse:(FMCAlertResponse*) response;
-(void) onChangeRegistrationResponse:(FMCChangeRegistrationResponse*) response;
-(void) onCreateInteractionChoiceSetResponse:(FMCCreateInteractionChoiceSetResponse*) response;
-(void) onDeleteCommandResponse:(FMCDeleteCommandResponse*) response;
-(void) onDeleteFileResponse:(FMCDeleteFileResponse*) response;
-(void) onDeleteInteractionChoiceSetResponse:(FMCDeleteInteractionChoiceSetResponse*) response;
-(void) onDeleteSubMenuResponse:(FMCDeleteSubMenuResponse*) response;
-(void) onEndAudioPassThruResponse:(FMCEndAudioPassThruResponse*) response;
-(void) onError:(NSException*) e;
-(void) onGenericResponse:(FMCGenericResponse*) response;
-(void) onGetDTCsResponse:(FMCGetDTCsResponse*) response;
-(void) onGetVehicleDataResponse:(FMCGetVehicleDataResponse*) response;
-(void) onListFilesResponse:(FMCListFilesResponse*) response;
-(void) onOnAppInterfaceUnregistered:(FMCOnAppInterfaceUnregistered*) notification;
-(void) onOnAudioPassThru:(FMCOnAudioPassThru*) notification;
-(void) onOnButtonEvent:(FMCOnButtonEvent*) notification;
-(void) onOnButtonPress:(FMCOnButtonPress*) notification;
-(void) onOnCommand:(FMCOnCommand*) notification;
-(void) onOnLanguageChange:(FMCOnLanguageChange*) notification;
-(void) onOnPermissionsChange:(FMCOnPermissionsChange*) notification;
-(void) onOnVehicleData:(FMCOnVehicleData*) notification;
-(void) onPerformAudioPassThruResponse:(FMCPerformAudioPassThruResponse*) response;
-(void) onPerformInteractionResponse:(FMCPerformInteractionResponse*) response;
-(void) onPutFileResponse:(FMCPutFileResponse*) response;
-(void) onReadDIDResponse:(FMCReadDIDResponse*) response;
-(void) onRegisterAppInterfaceResponse:(FMCRegisterAppInterfaceResponse*) response;
-(void) onResetGlobalPropertiesResponse:(FMCResetGlobalPropertiesResponse*) response;
-(void) onScrollableMessageResponse:(FMCScrollableMessageResponse*) response;
-(void) onSetAppIconResponse:(FMCSetAppIconResponse*) response;
-(void) onSetDisplayLayoutResponse:(FMCSetDisplayLayoutResponse*) response;
-(void) onSetGlobalPropertiesResponse:(FMCSetGlobalPropertiesResponse*) response;
-(void) onSetMediaClockTimerResponse:(FMCSetMediaClockTimerResponse*) response;
-(void) onShowResponse:(FMCShowResponse*) response;
-(void) onSliderResponse:(FMCSliderResponse*) response;
-(void) onSpeakResponse:(FMCSpeakResponse*) response;
-(void) onSubscribeButtonResponse:(FMCSubscribeButtonResponse*) response;
-(void) onSubscribeVehicleDataResponse:(FMCSubscribeVehicleDataResponse*) response;
-(void) onUnregisterAppInterfaceResponse:(FMCUnregisterAppInterfaceResponse*) response;
-(void) onUnsubscribeButtonResponse:(FMCUnsubscribeButtonResponse*) response;
-(void) onUnsubscribeVehicleDataResponse:(FMCUnsubscribeVehicleDataResponse*) response;


@end
