import React, {Component} from 'react';
import {StyleSheet, Text, View} from 'react-native';
import CardConnect from 'react-native-card-connect';
import moment from 'moment';

export default class App extends Component {
  state = {
    status: 'starting',
    message: '--'
  };
  componentDidMount() {
    expirationDate = moment('12/22', 'MM/YY').toISOString();
    console.log(expirationDate);
    CardConnect.setEndpoint('fts.cardconnect.com:6443')
    CardConnect.generateTokenForCard('4788250000121443', expirationDate, '123', (error, token) => {
      this.setState({
        status: 'native callback received',
        message: token ? token : error
      });
    });
  }
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>☆CardConnect example☆</Text>
        <Text style={styles.instructions}>STATUS: {this.state.status}</Text>
        <Text style={styles.welcome}>☆NATIVE CALLBACK MESSAGE☆</Text>
        <Text style={styles.instructions}>{this.state.message}</Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});
