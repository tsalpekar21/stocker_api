class CreateTasksForUsers < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.datetime :due
      t.integer :user_id, null: false
      t.belongs_to :user
      t.timestamps null: false
    end

    add_foreign_key :tasks, :users
  end
end
