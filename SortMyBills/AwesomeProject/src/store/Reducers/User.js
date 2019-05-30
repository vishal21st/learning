import * as actions from '../ActionTypes'
export default  (state = {}, action) => {
  switch (action.type) {
    case actions.LOGIN_SUCCESS:
      return {...state, user: action.payload}
    case actions.LOGIN_ERROR:
      return { ...state, user: null }
    default:
      return state
  }
}