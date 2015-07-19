class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.integer :user_one_id
      t.integer :user_two_id

      t.timestamps null: false
    end

    add_index :chats, :user_one_id
    add_index :chats, :user_two_id
  end
end
