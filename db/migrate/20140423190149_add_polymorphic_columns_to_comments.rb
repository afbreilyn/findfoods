class AddPolymorphicColumnsToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :commentable_id, :integer
  	add_column :comments, :commentable_type, :string
  	
  	remove_column :comments, :parent_comment_id, :integer
  	remove_column :comments, :restaurant_id, :integer

  	add_index :comments, :commentable_id
  end
end
