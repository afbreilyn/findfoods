class AddColumnsToNotifications < ActiveRecord::Migration
  def change
  	add_column :notifications, :event_id, :integer
  end
end
