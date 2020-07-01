package com.karmasoftonline;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;

import com.bolt.consumersdk.CCConsumer;
import com.bolt.consumersdk.CCConsumerTokenCallback;
import com.bolt.consumersdk.domain.CCConsumerCardInfo;
import com.bolt.consumersdk.domain.CCConsumerAccount;
import com.bolt.consumersdk.domain.CCConsumerError;

public class CardConnectModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;

    public CardConnectModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "CardConnect";
    }

    @ReactMethod
    public void setEndpoint(String endpoint) {
        CCConsumer.getInstance().getApi().setEndPoint("https://" + endpoint);
    }

    @ReactMethod
    public void generateTokenForCard(String cardNumber, String expirationDate, String cvv, Callback callback) {
        CCConsumerCardInfo card = new CCConsumerCardInfo();
        card.setCardNumber(cardNumber);
        card.setExpirationDate(expirationDate);
        card.setCvv(cvv);

        final Callback cb = callback;

        CCConsumer.getInstance().getApi().generateAccountForCard(card, new CCConsumerTokenCallback() {
            @Override
            public void onCCConsumerTokenResponse(CCConsumerAccount consumerAccount) {
                cb.invoke("what the fuck", "token:" + consumerAccount.getToken() + ",url:" + CCConsumer.getInstance().getApi().getEndPoint());
            }

            @Override
            public void onCCConsumerTokenResponseError(CCConsumerError error) {
                cb.invoke("error:" + error.getResponseMessage() + "str:" + error.toString(), "we got an error:" + CCConsumer.getInstance().getApi().getEndPoint());
            }
        });
    }
}
