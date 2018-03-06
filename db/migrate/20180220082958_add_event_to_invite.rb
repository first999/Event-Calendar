class AddEventToInvite < ActiveRecord::Migration
  def change
    add_reference :invites, :event, index: true, foreign_key: true
  end
end
