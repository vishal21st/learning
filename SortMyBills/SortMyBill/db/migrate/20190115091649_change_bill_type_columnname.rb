class ChangeBillTypeColumnname < ActiveRecord::Migration[5.2]
  def change
    rename_column :bill_types, :type, :name
  end
end
