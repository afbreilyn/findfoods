class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
    	t.string :name, :null => false
    	t.string :subtitle
    	
    	t.string :street1, :null => false
    	t.string :street2
     	t.string :city, :null => false
    	t.string :state, :null => false
    	t.integer :zip, :null => false

    	t.integer :owner_id, :null => false

      t.timestamps
    end

    add_index :restaurants, :name
    add_index :restaurants, :owner_id
  end
end
