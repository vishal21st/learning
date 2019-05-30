import { combineReducers, createStore , applyMiddleware} from 'redux'
import BillReducer from './Reducers/BillReducer'
import User from './Reducers/User'
import Auth from './Reducers/Auth'
import BillFormReducer from './Reducers/BillFormReducer'
import thunk from 'redux-thunk';
const AppReducers = combineReducers({
  BillReducer,
  BillFormReducer,
  User,
  Auth
})

let store = createStore(AppReducers,   applyMiddleware(thunk))

export default store