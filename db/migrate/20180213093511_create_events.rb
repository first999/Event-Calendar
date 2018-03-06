class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :location
      t.datetime :startsAt
      t.datetime :endsAt

      t.timestamps null: false
    end
  end
end
