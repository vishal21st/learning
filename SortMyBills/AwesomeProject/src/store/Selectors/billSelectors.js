import { createSelector } from 'reselect'

const bills = state => state.BillReducer.bills
const filterType = (state, filterType) => filterType
const billFilters = (state) => state.BillReducer.billFilters

export const getBillFilter = createSelector(
  [ bills, filterType, billFilters ],
  (bills, filterType, billFilters) => {
    return bills.filter((bill) => {
      let type = filterType
      
      if (!type) {

        type = billFilters.type
      }
      
      return bill.billType == type
    })
  }
)