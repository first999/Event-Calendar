class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.boolean :attending

      t.timestamps null: false
    end
  end
end
