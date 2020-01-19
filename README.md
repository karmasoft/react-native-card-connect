# react-native-card-connect

## Getting started

`$ npm install react-native-card-connect --save`

### Mostly automatic installation

`$ react-native link react-native-card-connect`

## Usage
```javascript
import CardConnect from 'react-native-card-connect';
import moment from 'moment';

expDate = moment('12/22', 'MM/YY').toISOString();
CardConnect.setEndpoint('fts.cardconnect.com:6443')
// card, expiration date, CVV
CardConnect.generateTokenForCard('4788250000121443', expDate, '123', (error, token) => {
  // handle error or generated token
});
```

## Additional Information

[CardConnect Mobile SDK](https://developer.cardconnect.com/mobile-sdks#get-a-token)
