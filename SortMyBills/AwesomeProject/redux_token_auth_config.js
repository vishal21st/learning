import { generateAuthActions } from 'redux-token-auth'
import { authUrl } from './Constants'

const config = {
  authUrl,
  userAttributes: {
    firstName: 'first_name'
  },
  userRegistrationAttributes: {
    firstName: 'first_name'
  }
}

const {
  registerUser,
  signInUser,
  signOutUser,
  verifyCredentials
} = generateAuthActions(config)

export {
  registerUser,
  signInUser,
  signOutUser,
  verifyCredentials,
}