class RemoveStarsFromComments < ActiveRecord::Migration
  def change
  	remove_column :comments, :stars, :decimal
  end
end
