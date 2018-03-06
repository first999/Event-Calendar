class SetNotNullEvents < ActiveRecord::Migration
  def change
    change_column_null :events, :title, false
    change_column_null :events, :location, false
    change_column_null :events, :startsAt, false
    change_column_null :events, :user_id, false
  end
end
