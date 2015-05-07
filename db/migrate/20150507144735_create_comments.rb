class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :c_content

      t.timestamps null: false
    end
  end
end
