import React, {Component} from 'react';
import { StyleSheet, View, Text, TouchableOpacity } from 'react-native';


class Button extends Component{
  constructor(props) {
    super(props)
    this.state = {}
  }

  buttonStyles() {
    let { type } = this.props
    return styles[type]
  }

  render() {
    const {text} = this.props;
    return (
      <TouchableOpacity 
        style={[styles.container, this.buttonStyles()]}>
        <Text style={styles.text}>{text}</Text>
      </TouchableOpacity>
    )
  }
}

const styles = StyleSheet.create({
  container: {
    color: '#ffffff',
    alignItems: "center",
    justifyContent: "center",
    borderRadius: 4,
    width: '100%',
    height: 40,
    marginBottom: 15
  },
  primary: {
    backgroundColor: "#3E7E6C",
  },
  secondary: {
    backgroundColor: "#6D042C",
    color: 'black'
  },
  text: {
    color: '#ffffff',
    
  }
})

export default Button