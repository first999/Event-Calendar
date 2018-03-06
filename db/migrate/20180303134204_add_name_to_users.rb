class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :full_name, :string
    change_column_null :users, :full_name, false
  end
end
