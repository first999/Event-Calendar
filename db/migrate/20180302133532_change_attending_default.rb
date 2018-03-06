class ChangeAttendingDefault < ActiveRecord::Migration
  def change
    change_column_default :invites, :attending, from: nil, to: false
  end
end