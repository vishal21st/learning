import * as actions from '../ActionTypes'

const initialState = {
  billNumber: "",
  billAmount: "",
  billType: "medical",
  billDate: new Date()
}


export default  (state = initialState, action) => {
  switch (action.type) {
    case actions.INITIALIZE_BILL_FORM:
      return {...state,  billNumber: "", billAmount: "", billType: action.payload, billDate: new Date() }
    case actions.UPDATE_BILL_FORM:
      return {...state, ...action.payload}
    default:
      return state
  }
}

