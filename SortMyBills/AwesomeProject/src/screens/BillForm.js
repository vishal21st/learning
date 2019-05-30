/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';
import {Platform, StyleSheet, TextInput, View, Button, Text, Image, TouchableOpacity, KeyboardAvoidingView, Picker} from 'react-native';
import { connect } from 'react-redux';
import { dirPicutures } from '../helpers/directoryStorage';
import InputBox from '../components/InputBox'
import { saveBill } from '../store/Actions/BillActions'
import { initializeNewBillForm, updateBillForm } from '../store/Actions/BillFormActions'
import { KeyboardAwareScrollView } from 'react-native-keyboard-aware-scroll-view'
import DatePicker from 'react-native-datepicker'
class BillForm extends Component{
  constructor(props) {
    super(props)
  }

  getFileUri() {
    return ("file:///" + dirPicutures + '/110119_1219983.jpg')
  }
  
  saveBill() {
    let { bills, billAmount, billNumber, billDate, billType } = this.props
    let that = this
    
    bills.push({
      billAmount,
      billNumber,
      billDate,
      billType
    })

    this.props.saveBill(bills)
    .then((response) => {
      that.props.navigation.navigate('Home')
    })
    .catch((err) => {
      console.log(err)
    })
  }

  updateValue(key, value) {
    let payload = {}
    payload[key] = value
    this.props.updateBillForm(payload)
  }

  renderBillOptions() {
    let { billTypes } = this.props
    return billTypes.map((bill, index) => {
      return <Picker.Item key={index} label={bill.label} value={bill.value} />
    })
  }


  render() {
    let { billAmount, billNumber, billType, billDate } = this.props
    return (
      <KeyboardAwareScrollView 
        style={styles.container}>
          <Image
            source={require('../assets/images/thumbnail.png')}
            style={styles.Preview}
          />
          <View style={styles.pickerWrapper}>
            <Picker 
              selectedValue={billType}
              style={styles.picker}
              onValueChange={(itemValue, itemIndex) =>{this.updateValue('billType', itemValue)}}>
              {this.renderBillOptions()}
            </Picker>
          </View>
          <InputBox placeholder="Number" 
            label="Bill Number"
            inputName="billNumber"
            value={billNumber} 
            type="text"
            onChange={this.updateValue.bind(this)}/>

          <InputBox placeholder="Amount" 
            label="Bill Amount"
            inputName="billAmount"
            type="number"
            value={billAmount} 
            onChange={this.updateValue.bind(this)}/>
            
           <DatePicker
            style={{width: '100%', backgroundColor: '#fff', marginBottom: 15}}
            date={billDate}
            mode="date"
            placeholder="select date"
            format="YYYY-MM-DD"
            minDate="2016-05-01"
            maxDate={new Date()}
            confirmBtnText="Confirm"
            cancelBtnText="Cancel"
            customStyles={{
              dateIcon: {
                position: 'absolute',
                left: 0,
                top: 4,
                marginLeft: 0
              },
              dateInput: {
                marginLeft: 36,
                borderColor: 'transparent'
              }
            }}
            onDateChange={(date) => {this.updateValue(billDate, date)}}
          />
          
          <TouchableOpacity
            style={[styles.buttonStyle, styles.buttonPrimary]}
            onPress={() => this.saveBill()}>
            <Text style={styles.buttonText}>Save</Text>
          </TouchableOpacity>

          <TouchableOpacity
            style={[styles.buttonStyle, styles.buttonSecondary]}
            onPress={() => this.cancel()}>
            <Text style={styles.buttonText}>Cancel</Text>
          </TouchableOpacity>

      </KeyboardAwareScrollView>
    );
  }
}


const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: 'column',
    backgroundColor: '#eee',
    padding: 15
  },
  Preview: {
    height: 300,
    width: '100%',
    borderRadius: 8,
    marginBottom: 30
  },
  card: {
    backgroundColor: "#fff",
    elevation: 3,
    borderRadius: 10,
    padding: 5,
    marginBottom: 20
  },
  buttonStyle: {
    padding:10,
    borderRadius:5,
    marginBottom: 10
  },
  buttonPrimary: {
    backgroundColor: '#202646'
  },
  buttonSecondary: {
    backgroundColor: 'red'
  },
  buttonText: {
    color: "#fff",
    textAlign:  "center"
  },
  pickerWrapper: {
    backgroundColor: '#fff',
    marginBottom: 10,
    borderRadius: 4
  },
  picker: {
    height: 50, 
    width: '100%'
  }
});


const mapStateToProps = (state) => {  
  const { bills, billTypes } = state.BillReducer
  return { bills, billTypes, ...state.BillFormReducer }
};

const mapDispatchToProps = (dispatch) => {
  return {
    saveBill: (payload) => {
      return dispatch(saveBill(payload))
    },
    initializeNewBillForm: () => {
      return dispatch(initializeNewBillForm())
    },
    updateBillForm: (payload) => {
      return dispatch(updateBillForm(payload))
    }
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(BillForm);