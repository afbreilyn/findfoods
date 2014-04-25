class ChangeReadNameToIsReadInNotifications < ActiveRecord::Migration
  def change
  	remove_column :notifications, :read, :boolean
  	add_column :notifications, :is_read, :boolean

  	add_index :notifications, :is_read
  end
end
