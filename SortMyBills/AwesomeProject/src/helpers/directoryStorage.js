
import { Platform } from 'react-native';
const RNFS = require('react-native-fs');

export const dirHome = Platform.select({
  ios: `${RNFS.DocumentDirectoryPath}/sortMyBills`,
  android: `${RNFS.ExternalStorageDirectoryPath}/sortMyBills`
});

export const dirPicutures = `${dirHome}/Pictures`;
export const dirDocs = `${dirHome}/Docs`