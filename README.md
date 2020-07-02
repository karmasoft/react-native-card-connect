# react-native-card-connect

## Getting started

`$ npm install react-native-card-connect --save`

### Mostly automatic installation

For RN Version < 0.60 (no autolinking)

`$ react-native link react-native-card-connect`

For RN Version > 0.60 (with autolinking) nothing needs to be done other than installing the package.

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
