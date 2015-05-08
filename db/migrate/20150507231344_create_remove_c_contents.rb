class CreateRemoveCContents < ActiveRecord::Migration
  def change
   remove_column :comments, :c_content
  end
end
