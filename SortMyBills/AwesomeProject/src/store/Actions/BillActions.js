import axios from 'axios'
import * as actions from '../ActionTypes'
import billApi from '../Api/billApi'

export const getBills = () => {
  return (dispatch) => {    
    billApi.getbills()
    .then((response) => {
      response = response || []
      dispatch({
        type: actions.GET_BILL_SUCCESS,
        payload: response || []
      })
    })
    .catch((error) => {
      console.log(error)
    })
  }
}

export const saveBill = (payload) => {
  return (dispatch) => {
    return billApi.saveBill(payload)
    .then((response) => {
      dispatch(getBills())
    })
    .catch((err) => {
      console.log(err)
    })
  }
}

export const clearBills = () => {
  return (dispatch) => {
    return billApi.deleteBills()
    .then((response) => {
      dispatch(getBills())
    })
    .catch(err => {
      console.log(err)
    })
  }
}

export const updateBillFilters = (payload) => {
  return (dispatch) => {
    dispatch({
      type: actions.UPDATE_BILL_FILTERS,
      payload
    })
  }
}