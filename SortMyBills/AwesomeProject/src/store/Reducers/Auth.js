import * as actions from '../ActionTypes'

export default  (state = {}, action) => {
  switch (action.type) {
    case actions.LOGIN_SUCCESS:
      return { ...state, loginError: false }
    case actions.SAVE_ACCESS_TOKEN:
      return {...state, ...action.payload }
    case actions.LOGIN_ERROR:
      return { ...state, loginError: true }
    default:
      return state
  }
}
