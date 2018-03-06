class SetDefaultDesc < ActiveRecord::Migration
  def change
    change_column_default :events, :description, 'None'
  end
end
