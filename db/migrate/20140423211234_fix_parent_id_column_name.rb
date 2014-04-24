class FixParentIdColumnName < ActiveRecord::Migration
  def change
  	rename_column :comments, :parent_id, :parent_comment_id
  end
end
