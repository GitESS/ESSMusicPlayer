//  FMCLanguage.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCLanguage : FMCEnum {}

+(FMCLanguage*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCLanguage*) EN_US;
+(FMCLanguage*) ES_MX;
+(FMCLanguage*) FR_CA;
+(FMCLanguage*) DE_DE;
+(FMCLanguage*) ES_ES;
+(FMCLanguage*) EN_GB;
+(FMCLanguage*) RU_RU;
+(FMCLanguage*) TR_TR;
+(FMCLanguage*) PL_PL;
+(FMCLanguage*) FR_FR;
+(FMCLanguage*) IT_IT;
+(FMCLanguage*) SV_SE;
+(FMCLanguage*) PT_PT;
+(FMCLanguage*) NL_NL;
+(FMCLanguage*) EN_AU;
+(FMCLanguage*) ZH_CN;
+(FMCLanguage*) ZH_TW;
+(FMCLanguage*) JA_JP;
+(FMCLanguage*) AR_SA;
+(FMCLanguage*) KO_KR;
+(FMCLanguage*) PT_BR;
+(FMCLanguage*) CS_CZ;
+(FMCLanguage*) DA_DK;
+(FMCLanguage*) NO_NO;

@end
