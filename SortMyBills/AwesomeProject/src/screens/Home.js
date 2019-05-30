/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';
import {Platform, StyleSheet, TextInput, View, Text, TouchableOpacity} from 'react-native';
import ButtonTile from '../components/ButtonTile'
import { connect } from 'react-redux';
import { Icon } from 'react-native-elements';
import { getBills, clearBills, updateBillFilters } from '../store/Actions/BillActions'
import { getBillFilter } from '../store/Selectors/billSelectors'
import { generateExcelSheet } from '../store/Actions/ExcelActions'
import MailExcelButton from '../components/MailExcelButton'
import Button from '../components/Button'
class Home extends Component{
  constructor(props) {
    super(props)
    this.state = {}
  }

  componentDidMount() {
    this.props.getBills()
  }

  renderList() {
    let self = this
    return this.props.billTypes.map((item, index) => {
      return <ButtonTile 
        key={index}
        icon={item.icon} 
        label={item.label} key={index} 
        value={item.value}
        bills={this.props[`${item.value}Bills`]}
        handlePress={this.showBills.bind(this)}/>
    })
  }

  showBills(billType) {
    this.props.updateBillFilters({
      type: billType
    })
    this.props.navigation.navigate('BillListScreen')
  }

  generateExcel() {
    let {medicalBills, ltaBills, booksBills, petrolBills} = this.props
    let headerRow = ["Bill no", "Amount", "Date"]
    let self = this
    let medical = [headerRow, ...medicalBills.map((bill) => {
      return self.getBillObjeValueInOrder(bill)
    })]
    let lta = [headerRow, ...ltaBills.map((bill) => {
      return self.getBillObjeValueInOrder(bill)
    })]
    let petrol = [headerRow, ...petrolBills.map((bill) => {
      return self.getBillObjeValueInOrder(bill)
    })]
    let books = [headerRow, ...booksBills.map((bill) => {
      return self.getBillObjeValueInOrder(bill)
    })]
    let payload = {
      medical, lta, petrol, books
    }

    this.props.generateExcelSheet(payload)
  }

  getBillObjeValueInOrder(bill) {
    let {billNumber, billAmount, billDate} = bill
    return [billNumber, billAmount, billDate]
  }


  render() {
    return (
      <View style={styles.container}>
        <View style={styles.billList}>
          {this.renderList()}
        </View>
        <View style={styles.footer}>
          <Button type="primary" text="Add Bill" onPress={() => this.props.navigation.navigate('BillForm')}></Button>
          <Button type="secondary" text="secondary"></Button>
          <TouchableOpacity onPress={() => this.props.navigation.navigate('BillForm')}>
            <Icon name="camera" style={{ fontSize: 40, color: 'white' }} />
          </TouchableOpacity>

          <TouchableOpacity onPress={() => this.props.clearBills()}>
            <Icon name="trash" style={{ fontSize: 40, color: 'white' }} />
          </TouchableOpacity>

          <TouchableOpacity onPress={() => this.generateExcel()}>
            <Text>Excel</Text>
          </TouchableOpacity>
          <MailExcelButton></MailExcelButton>
        </View>
        
        
      </View>
    );
  }
}


const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: 'column',
    backgroundColor: '#ffffff',
    padding: 15
  },
  billList: {
    flex: 2,
    flexWrap: 'wrap',
    flexDirection: 'row'
  },
  footer: {
    flex: 1,
    flexDirection: 'column'
  }
});

const mapStateToProps = (state, ownProps) => {
  let { BillReducer, User } = state
  let { billTypes } = BillReducer
  let { user } = User
  return {
    user, 
    billTypes, 
    medicalBills:  getBillFilter(state, 'medical'),
    ltaBills: getBillFilter(state, 'lta'),
    booksBills: getBillFilter(state, 'books'),
    petrolBills: getBillFilter(state, 'petrol')
  }
};

const mapDispatchToProps = (dispatch) => {
  return {
    getBills: () => {
      return dispatch(getBills())
    },
    clearBills: () => {
      return dispatch(clearBills())
    },
    updateBillFilters: (payload) => {
      return dispatch(updateBillFilters(payload))
    },
    generateExcelSheet: (payload) => {
      return dispatch(generateExcelSheet(payload))
    }
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(Home);