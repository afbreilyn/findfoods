class ChangeColumnNames < ActiveRecord::Migration
  def change
  	rename_column :comments, :parent_comment_id, :parent_comment_id
  	rename_column :tags, :tags, :body
  end
end
