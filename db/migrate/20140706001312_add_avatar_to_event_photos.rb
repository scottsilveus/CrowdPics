class AddAvatarToEventPhotos < ActiveRecord::Migration
  def self.up
    add_attachment :event_photos, :avatar
  end

  def self.down
    remove_attachment :event_photos, :avatar
  end
end
