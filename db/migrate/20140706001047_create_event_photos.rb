class CreateEventPhotos < ActiveRecord::Migration
  def change
    create_table :event_photos do |t|
    	t.string :name

      	t.timestamps
    end
  end
end