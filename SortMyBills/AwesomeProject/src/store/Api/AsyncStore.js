import Config from 'react-native-config'
import { AsyncStorage } from 'react-native'
const { API_URL , DB_NAME} = Config
export const saveData = (key, value) => {
  try {
    return AsyncStorage.setItem(`${DB_NAME}:key`, JSON.stringify(value))
  } catch(err) {
    console.log(err)
  }
}

export const getData = async (key) => {
  try {
    response = await AsyncStorage.getItem(`${DB_NAME}:key`)
    return JSON.parse(response)
  } catch(err) {
    console.log(err)
  }
}

export const deleteData = (key) => {
  try {
    return AsyncStorage.removeItem(`${DB_NAME}:key`)
  } catch(err) {
    console.log(err)
  }
}