import axios from 'axios'
import * as actions from '../ActionTypes'
import authApi from '../Api/authApi'

export const saveToken = (payload) => {
  return (dispatch) => {
    dispatch({
      type: actions.SAVE_ACCESS_TOKEN,
      payload: payload
    })
  }
}

export const removeToken = () => {
  return (dispatch) => {
    dispatch({
      type: actions.REMOVE_ACCESS_TOKEN
    })
  }
}

export const loginUser = ({email, password}) => {
  return (dispatch) => {
    return authApi.login({email, password})    
    .then((response) => {
      const { headers, data } = response
      // const { 'access-token', expiry, uid, client } = headers
      dispatch({
        type: actions.LOGIN_SUCCESS, 
        payload: data.data
      })
      dispatch({
        type: actions.SAVE_ACCESS_TOKEN,
        payload: headers
      })
      return response
    })
    .catch((error) => {
      dispatch({
        type: actions.LOGIN_ERROR        
      })
      console.log(error)
      return error
    })
  }
}