class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :crypted_password
      t.string :salt

      t.timestamps
    end
    add_index :users, :username, unique: true
  end
end
