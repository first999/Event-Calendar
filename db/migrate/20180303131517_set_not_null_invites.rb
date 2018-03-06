class SetNotNullInvites < ActiveRecord::Migration
  def change
    change_column_null :invites, :user_id, false
    change_column_null :invites, :event_id, false
  end
end
