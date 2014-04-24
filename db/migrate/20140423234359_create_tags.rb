class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
    	t.integer :restaurant_id
    	t.integer :author_id
    	t.string :tags
    	
    	t.timestamps
    end
  end
end
