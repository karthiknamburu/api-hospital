class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.text :body
      t.integer :chat_id

      t.column :created_at, :datetime
    end

    add_index :messages, :chat_id
  end
end
