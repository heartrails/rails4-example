class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user, null: false, index: true
      t.belongs_to :post, null: false, index: true
      t.string :body, null: false

      t.timestamps
    end
  end
end
