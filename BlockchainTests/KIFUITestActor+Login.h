//
//  KIFUITestActor+Login.h
//  Blockchain
//
//  Created by Kevin Wu on 4/14/16.
//  Copyright © 2016 Qkos Services Ltd. All rights reserved.
//

#import <KIF/KIF.h>

@interface KIFUITestActor (Login)
- (void)createNewWallet;
- (void)goToSend;
- (void)typeInAddress;
- (void)send;

- (void)confirmSendAmountDecimalPeriodDecimalFirst;
- (void)confirmSendAmountDecimalPeriodZeroThenDecimal;
- (void)confirmSendAmountDecimalPeriodNumberThenDecimal;
- (void)confirmSendAmountDecimalPeriodArabicTextDecimalFirst;
- (void)confirmSendAmountDecimalPeriodArabicTextZeroThenDecimal;
- (void)confirmSendAmountDecimalPeriodArabicTextNumberThenDecimal;

- (void)confirmSendAmountDecimalCommaDecimalFirst;
- (void)confirmSendAmountDecimalCommaZeroThenDecimal;
- (void)confirmSendAmountDecimalCommaNumberThenDecimal;
- (void)confirmSendAmountDecimalCommaArabicTextDecimalFirst;
- (void)confirmSendAmountDecimalCommaArabicTextZeroThenDecimal;
- (void)confirmSendAmountDecimalCommaArabicTextNumberThenDecimal;

- (void)confirmSendAmountDecimalArabicCommaDecimalFirst;
- (void)confirmSendAmountDecimalArabicCommaZeroThenDecimal;
- (void)confirmSendAmountDecimalArabicCommaNumberThenDecimal;
- (void)confirmSendAmountDecimalArabicCommaAndTextDecimalFirst;
- (void)confirmSendAmountDecimalArabicCommaAndTextZeroThenDecimal;
- (void)confirmSendAmountDecimalArabicCommaAndTextNumberThenDecimal;

- (void)goToReceive;
- (uint64_t)confirmReceiveAmount:(NSString *)randomAmount;
- (uint64_t)computeBitcoinValue:(NSString *)amount;
@end
