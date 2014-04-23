class FixParentIdColumnName < ActiveRecord::Migration
  def change
  	rename_column :comments, :parent_id, :comment_parent_comment_id
  end
end
