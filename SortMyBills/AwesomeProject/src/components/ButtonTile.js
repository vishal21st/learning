/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';
import {Platform, StyleSheet, TextInput, View, Text,  TouchableOpacity} from 'react-native';

import { Icon } from 'react-native-elements';

export default class ButtonTile extends Component{
  constructor(props) {
    super(props)
  }

  billTotal() {
    const { bills } = this.props
    const val =  bills.reduce((accumulator, currentValue) => {
      let value = 0
      if (currentValue) {
        value = parseFloat(currentValue.billAmount)
      }
      return (accumulator +  value)
    }, 0)

    return val.toLocaleString()
  }

  render() {
    let { value } = this.props
    return (
      <TouchableOpacity style={styles.buttonTile} onPress={() => this.props.handlePress(value)}>
        <View style={styles.buttonTileInner}>
          <Icon  style={styles.colorText} name={this.props.icon} type='font-awesome'/>
          <Text style={styles.colorText}>{this.props.label}</Text>
          <Text style={styles.colorText}>{this.billTotal()}</Text>
        </View>
      </TouchableOpacity>
    );
  }
}
 
const styles = StyleSheet.create({
  buttonTile: {
    width: '40%',
    height: '20%',
    margin: '5%',
    borderRadius: 4,
    borderWidth: 0.5,
    backgroundColor: '#f5ebca',
    borderColor: '#6D042C',
    padding: 20,
    color: '#ffff'
    // alignItems: 'center'
  },
  buttonTileInner: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  colorText: {
    color: '#6D042C'
  }
});

// https://www.freelancer.com/community/articles/120-stunning-color-combinations-for-your-next-design
