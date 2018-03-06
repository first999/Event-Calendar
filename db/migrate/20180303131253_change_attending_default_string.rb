class ChangeAttendingDefaultString < ActiveRecord::Migration
  def change
    change_column_default :invites, :attending, 'No response'
  end
end
