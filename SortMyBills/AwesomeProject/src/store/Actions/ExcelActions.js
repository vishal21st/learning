import XLSX from 'xlsx'
import { writeFile, readFile, DocumentDirectoryPath, stat, readDir, mkdir } from 'react-native-fs';
import {dirDocs} from '../../helpers/directoryStorage'
export const generateExcelSheet = (bills) => {
  
  return (dispatch) => {
    generalBillSheets(bills)
  }
}


const generalBillSheets = (bills) => {
  let new_workbook = XLSX.utils.book_new();
  for(let key in bills) {
    const rows = bills[key]
    const workSheet = XLSX.utils.aoa_to_sheet(rows)
    XLSX.utils.book_append_sheet(new_workbook, workSheet, key)
  }
  const wbout = XLSX.write(new_workbook, {type:'binary', bookType:"xlsx"});
  mkdir(dirDocs).then(() => {
    var path = `${dirDocs}/test.xls`
    writeFile(path, wbout, 'ascii').then((r)=>{
      console.log('workbook created')
    }).catch((e)=>{
      console.log(e)
    });
  })
}
