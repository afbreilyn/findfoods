class CreateRating < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
    	t.integer :rating
    end

    add_index :ratings, :rating
  end
end
