class DropLocationPhotos < ActiveRecord::Migration[5.2]
  def change
    drop_table :location_photos
  end
end
