class AddAPIKeyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :account_id, :string
    add_column :users, :secret_token, :string

    add_index :users, :account_id
    add_index :users, :secret_token
  end
end
