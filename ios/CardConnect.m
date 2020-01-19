#import "CardConnect.h"
#import <CardConnectConsumerSDK/CardConnectConsumerSDK.h>
#import <CardConnectConsumerSDK/CCCCardInfo.h>
#import <CardConnectConsumerSDK/CCCAccount.h>
#import <React/RCTLog.h>
#import <React/RCTConvert.h>

@implementation CardConnect

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(setEndpoint:(NSString *)endpoint) {
    [CCCAPI instance].endpoint = endpoint;
}

RCT_EXPORT_METHOD(generateTokenForCard:(NSString *)cardNumber expirationDate:(NSDate *)expirationDate CVV:(NSString *)CVV callback:(RCTResponseSenderBlock)callback)
{
    CCCCardInfo *card = [CCCCardInfo new];
    card.cardNumber = cardNumber;
    card.expirationDate = expirationDate;
    card.CVV = CVV;

    // RCTLogInfo(@"Testing logging from native module with params: %@, %@", numberArgument, stringArgument);
    [[CCCAPI instance] generateAccountForCard:card completion:^(CCCAccount *account, NSError *error){
        if (account) {
            callback(@[[NSNull null], account.token]);
        } else {
            callback(@[error.description, [NSNull null]]);
        }
    }];
}

@end
