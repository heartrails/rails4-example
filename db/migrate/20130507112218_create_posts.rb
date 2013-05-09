class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :user, null:false, index: true
      t.text :text
      t.string :url
      t.integer :comments_count, null: false, default: 0, index: true

      t.timestamps
    end
  end
end
