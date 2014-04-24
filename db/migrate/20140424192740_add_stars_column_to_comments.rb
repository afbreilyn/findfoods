class AddStarsColumnToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :stars, :decimal, precision: 5, scale: 4

  	add_index :comments, :stars
  end
end
