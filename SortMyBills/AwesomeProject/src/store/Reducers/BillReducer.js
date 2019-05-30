import * as actions from '../ActionTypes'

const initialState = {
  billTypes: [
    { icon: "plus", label: "Medical", value: "medical" },
    { icon: "plane", label: "LTA", value: "lta" },
    { icon: "car", label: "Petrol", value: "petrol"  },
    { icon: "book", label: "Books", value: "books"  }
  ],
  bills: [],
  billForm: {
    billNumber: "",
    billAmount: "",
    billType: "medical",
    billDate: new Date()
  },
  billFilters: {
    type: "",
    dateStart: "",
    dateEnd: ""
  }
}


export default  (state = initialState, action) => {
  switch (action.type) {
    case actions.GET_BILL_SUCCESS:
      return  { ...state , bills: action.payload }
    case actions.INITIALIZE_BILL_FORM:
      return {...state, billForm: { billNumber: "", billAmount: "", billType: action.payload, billDate: new Date()}}
    case actions.INITIALIZE_EDIT_BILL_FORM:
      return {...state, billForm: action.payload}
    case actions.UPDATE_BILL_FORM:
      return {...state, billForm: action.payload}
    case actions.UPDATE_BILL_FILTERS:
      return { 
        ...state, 
        billFilters: {
          ...state.billFilters, 
          ...action.payload
        }
      }
    default:
      return state
  }
}

