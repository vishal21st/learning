/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';
import { StyleSheet, View, Button, Text, TouchableOpacity, FlatList } from 'react-native';
import { connect } from 'react-redux';
import { Icon } from 'react-native-elements';
import { getBills, clearBills } from '../store/Actions/BillActions'
import BillTile from '../components/BillTile'
import { getBillFilter } from '../store/Selectors/billSelectors'

class BillListScreen extends Component{
  constructor(props) {
    super(props)
    this.state = {}
  }

  renderList() {
    console.log(this.props.bills)
    return this.props.bills.map((item, index) => {      
      return <Text key={index}>{item.billNumber}</Text>
    })
  }

  render() {
    return (
      <View style={styles.container}>
        <FlatList
          data={this.props.bills}
          renderItem={({item}) => <BillTile amount={item.billAmount} heading="Medical" date="12/12/2019"></BillTile>}
        ></FlatList>
      </View>
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
  let { BillReducer, User } = state
  let { user } = User
  return { bills: getBillFilter(state), user }
};

const mapDispatchToProps = (dispatch) => {
  return {
    getBills: () => {
      return dispatch(getBills())
    }    
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(BillListScreen);