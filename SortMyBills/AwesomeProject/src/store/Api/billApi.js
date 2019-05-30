import Config from 'react-native-config'
import axios from 'axios'
const { API_URL , DB_NAME} = Config
console.log(Config)
import * as asyncStore from './AsyncStore'
export default {
  getbills: () => {
    try {      
      return asyncStore.getData('Bills')
    } catch(err) {
      console.log(err)
    }
    
  },
  saveBill: (data) => {    
    return asyncStore.saveData('Bills', data)
  },
  deleteBills: () => asyncStore.deleteData('Bills')
}