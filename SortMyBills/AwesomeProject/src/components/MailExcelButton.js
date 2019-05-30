/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';
import {StyleSheet, View, Text,  TouchableOpacity} from 'react-native';

import Mailer from 'react-native-mail';
import { writeFile, readFile, DocumentDirectoryPath, stat, readDir } from 'react-native-fs';
import {dirDocs} from '../helpers/directoryStorage'

export default class MailExcelButton extends Component{
  constructor(props) {
    super(props)
  }

  handleEmail = () => {
    console.log(DocumentDirectoryPath)
    Mailer.mail({
      subject: 'need help',
      recipients: ['vishal.singhal21st@gmail.com'],
      body: '<b>A Bold Body</b>',
      isHTML: true,
      attachment: {
        path: `${dirDocs}/test.xls`,  // The absolute path of the file from which to read data.
        type: 'xls',   // Mime Type: jpg, png, doc, ppt, html, pdf, csv
        name: 'test',   // Optional: Custom filename for attachment
      }
    }, (error, event) => {
      console.log(error)
      console.log(event)
      Alert.alert(
        error,
        event,
        [
          {text: 'Ok', onPress: () => console.log('OK: Email Error Response')},
          {text: 'Cancel', onPress: () => console.log('CANCEL: Email Error Response')}
        ],
        { cancelable: true }
      )
    });
  }


  render() {
    return (
      <TouchableOpacity style={styles.container}
       onPress={this.handleEmail}>
        <Text>Mail Excel sheet</Text>
      </TouchableOpacity>
    );
  }
}



const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: 'row'
  }
});


