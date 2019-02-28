class AddPhotoToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :photo, :string
  end
end
