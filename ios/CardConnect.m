#import "CardConnect.h"
#import <CardConnectConsumerSDK/CardConnectConsumerSDK.h>
#import <React/RCTLog.h>

@implementation CardConnect

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(sampleMethod:(NSString *)stringArgument numberParameter:(nonnull NSNumber *)numberArgument callback:(RCTResponseSenderBlock)callback)
{
    // TODO: Implement some actually useful functionality
    [CCCAPI instance].endpoint = @"fts.cardconnect.com:999";
    RCTLogInfo(@"Testing logging from native module with params: %@, %@", numberArgument, stringArgument);
    // [CCCAPI instance] generateAccountForCard:<your card object> completion:^(CCCAccount *account, NSError *error){}];
    callback(@[[NSString stringWithFormat: @"numberArgument: %@ stringArgument: %@, and test info", numberArgument, stringArgument]]);
}

@end
