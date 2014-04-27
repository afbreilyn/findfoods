class AddAttachmentAvatarToRestaurants < ActiveRecord::Migration
  def self.up
    change_table :restaurants do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :restaurants, :avatar
  end
end
