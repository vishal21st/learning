import axios from 'axios'
import * as actions from '../ActionTypes'
import billApi from '../Api/billApi'

export const initializeNewBillForm = () => {
  return (dispatch) => {
    dispatch({
      type: actions.INITIALIZE_BILL_FORM,
      payload: {
        billNumber: "",
        billAmount: "", 
        billType: action.payload, 
        billDate: new Date()
      }
    })
  }
}

export const updateBillForm = (payload) => {
  return (dispatch) => {
    dispatch({
      type: actions.UPDATE_BILL_FORM,
      payload
    })
  }
}