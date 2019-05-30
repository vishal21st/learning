/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

  import('./ReactotronConfig').then(() => console.log('Reactotron Configured'))

import React, {Component} from 'react';
import {Platform, StyleSheet, Text, View} from 'react-native';
import Login from './src/screens/Login'
import Home from './src/screens/Home'
import BillForm from './src/screens/BillForm'

import { createStackNavigator, createAppContainer } from "react-navigation";
import store from './src/store/index'
import { Provider } from 'react-redux'
import CameraScreen from './src/screens/CameraScreen';
import BillListScreen from './src/screens/BillListScreen';
// import configureStore from './redux/configure-store'
// import { verifyCredentials } from './redux_token_auth_config'
// const store = configureStore()
// verifyCredentials(store)

const AppNavigator = createStackNavigator(
  {
    Home: Home,
    Camera: CameraScreen,
    BillForm: BillForm,
    BillListScreen: BillListScreen
  },
  {
    initialRouteName: "Home"
  }
);

const AppContainer = createAppContainer(AppNavigator);

export default class App extends Component {
  render() {
    return (
      <Provider store={store}>
        <AppContainer/>
      </Provider>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'stretch',
    backgroundColor: '#F5FCFF',
  }
});
