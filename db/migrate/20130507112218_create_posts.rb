class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :user, index: true
      t.text :text
      t.string :url

      t.timestamps
    end
  end
end
