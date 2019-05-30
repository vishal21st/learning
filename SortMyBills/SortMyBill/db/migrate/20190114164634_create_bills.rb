class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.string  :bill_number
      t.string :bill_identifier
      t.decimal :amount
      t.date :date
      t.references :user
      t.timestamps
    end
  end
end
