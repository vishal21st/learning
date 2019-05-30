/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';
import {Platform, StyleSheet, TextInput, View, Text, TouchableOpacity} from 'react-native';

import { Icon } from 'react-native-elements';

export default class InputBox extends Component{
  constructor(props) {
    super(props)
    this.state = {
      type: this.props.type || "text",
      required: this.props.required || false,
      isValid: true,
      error: ""
    }
  }

  handleTextChange(text) {
    if (this.validate(text)) {
      this.props.onChange(this.props.inputName, text)
    } else {
      this.props.onChange(this.props.inputName, "")
    }
  }

  validate(text) {
    let { type, required } = this.state

    if (required && text == ("" || undefined || null)) {
      this.setState({isValid : false, error: "field is required"})
      return
    }

    if (type == "text" && typeof text != "string") {
      this.setState({isValid : false, error: "please provide a text"})
      return
    }
    
    text = parseFloat(text)
  
    if (type == "number" && isNaN(text)) {
      this.setState({isValid : false, error: "please provide a number"})
      return
    }

    this.setState({isValid: true, error: ""})
    return true
  }

  renderError() {
    if (!this.state.isValid) {
      return (<Text style={styles.error}>{this.state.error}</Text>)
    }
  }

  borderColor() {
    if (!this.state.isValid) {
      return ({borderBottomColor: 'red', borderBottomWidth: 2})
    }
  }

  render() {
    let {key} = this.props
    return (
      <View style={styles.container}>
        <TextInput
          placeholder={this.props.placeholder}
          style={[styles.textInput,this.borderColor()]}
          value={this.props.value}
          onChangeText={(text) => this.handleTextChange(text)}/>
        {this.renderError()}
      </View>
    );
  }
}



const styles = StyleSheet.create({
  container: {
    marginBottom: 10
  },
  textInput: {
    backgroundColor: "#fff"
  },
  error: {
    color: 'red'
  }
});


