class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :department_id
      t.string :name

      t.timestamps null: false
    end

    add_index :users, :department_id
  end
end
