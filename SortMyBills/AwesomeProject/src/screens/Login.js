/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';
import {Platform, StyleSheet, TextInput, View, Button, Text, TouchableOpacity} from 'react-native';

import { connect } from 'react-redux';
import { loginUser } from '../store/Actions/AuthActions'
class Login extends Component{
  constructor(props) {
    super(props)
    this.state = {email: '', password: ''}
  }
  
  Login(event) {
    const { email, password } = this.state
    let that = this
    this.props.loginUser({email, password})    
    .then((response) => {
      that.props.navigation.navigate("Home")
    })
    .catch((err) => {
      console.log(err)
    })
  }

  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.title}> Sort My Bills </Text>
        <TextInput placeholder="Enter User Name" value={this.state.userName}
          onChangeText={email => this.setState({email})} style={styles.textInput}></TextInput>
        <TextInput 
          placeholder="Enter Password"
          style={styles.textInput}
          secureTextEntry={true}
          type="password"
          value={this.state.password}
          onChangeText={password => this.setState({password})}></TextInput>
        <TouchableOpacity style={styles.login}>
          <Button
            onPress={event => this.Login(event)}
            title="Login"
            accessibilityLabel="Learn more about this purple button"></Button>
        </TouchableOpacity>
        <TouchableOpacity>
          <Button
            onPress={event => this.Login(event)}
            title="Signup"
            accessibilityLabel="Learn more about this purple button"></Button>
        </TouchableOpacity>
      </View>
    );
  }
}


const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#ffffff',
    alignItems: 'stretch',
    padding: 15
  },
  textInput: {
    backgroundColor: '#ffffff',
    marginBottom: 15,
    
  },
  title: {
    fontSize: 20,
    textAlign: 'center',
    marginBottom: 15
  },
  login: {
    marginBottom: 15
  }
});


const mapDispatchToProps = (dispatch) => {
  return {
    loginUser: (payload) => {
      return dispatch(loginUser(payload))
    }
  }
}

export default connect(null, mapDispatchToProps)(Login)