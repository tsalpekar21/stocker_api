class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :access_token, null: false
      t.datetime :expires, null: false
      t.integer :user_id, null: false
      t.boolean :deleted_at, default: false
      t.belongs_to :user
      t.timestamps null: false
    end

   add_foreign_key :tokens, :users
   #add_index :tokens, :user_id

  end
end
