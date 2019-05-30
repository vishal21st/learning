/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';
import {Platform, StyleSheet, TextInput, View, Button, Text} from 'react-native';
import Camera from '../components/Camera'
import { connect } from 'react-redux';

class CameraScreen extends Component{
  constructor(props) {
    super(props)
    this.state = {}
  }

  renderList() {
    return this.props.bills.map((item) => {
      return <ButtonTile icon={item.icon} label={item.label} value={item.value}/>
    })
  }

  render() {
    return (
      <Camera {...this.props}/>
    );
  }
}


const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: 'row',
    flexWrap: 'wrap',
    backgroundColor: '#ffffff',
    padding: 15
  }
});


const mapStateToProps = (state) => {
  const { bills } = state.BillReducer
  return { bills }
};

export default connect(mapStateToProps)(CameraScreen);