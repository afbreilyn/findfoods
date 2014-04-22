class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :fname, :null => false
    	t.string :mname
    	t.string :lname, :null => false

    	t.string :email, :null => false

    	t.string :city, :null => false
    	t.string :state, :null => false

    	t.string :password_digest, :null => false
    	t.string :session_token, :null => false

      t.timestamps
    end

    add_index :users, :email, :unique => true
    add_index :users, [:city, :state]
    add_index :users, :session_token, :unique => true
  end
end
