import Config from 'react-native-config'
import axios from 'axios'
const { API_URL } = Config
export default {
  login: (payload) =>{
    console.log(Config)
     return axios.post(`${Config.API_URL}/auth/sign_in`, payload)
  }
}