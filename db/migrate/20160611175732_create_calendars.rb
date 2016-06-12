class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.string :name
      t.integer :user_id, null: false
      t.belongs_to :user
      t.timestamps null: false
    end

    add_foreign_key :calendars, :users
  end
end
