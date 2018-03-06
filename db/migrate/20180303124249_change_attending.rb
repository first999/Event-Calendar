class ChangeAttending < ActiveRecord::Migration
  def change
    change_column :invites, :attending, :string
    change_column_null :invites, :attending, false
    change_column_default :invites, :attending, from: false, to: 'Brez odziva'
  end
end
