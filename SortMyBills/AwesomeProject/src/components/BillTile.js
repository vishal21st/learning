/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';
import {StyleSheet, View, Text,  TouchableOpacity, Image} from 'react-native';

import { Icon } from 'react-native-elements';

export default class BillTile extends Component{
  constructor(props) {

    super(props)
  }

  render() {
    return (
      <View style={styles.container}>
        <View style={styles.imageView}>
          <Image style={{width: 100, height: 50}} source={require('../assets/images/thumbnail.png')}></Image>
        </View>
        <View style={styles.billDetails}>
          <View style={styles.detailRow}>
            <View style={styles.detailHeader}>
              <Text style={styles.heading}>
                {this.props.heading}
              </Text>
              <Text style={styles.date}>
                {this.props.date}
              </Text>
            </View>
          </View>
          <View style={styles.detailRow}>
            <Text>            
              {this.props.amount}
            </Text>
          </View>
          <View style={styles.detailRow}></View>
        </View>
      </View>
    );
  }
}



const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: 'row'
  },
  imageView: {
    flex: 1
  },
  billDetails: {
    flex: 2
  },
  detailRow: {

  },
  detailHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between'
  },
  date: {

  },
  heading: {
    fontWeight: 'bold'
  }
  
});


