class AddBillTypeRef < ActiveRecord::Migration[5.2]
  def change
    add_reference :bills, :bill_type, foreign_key: true
  end
end
