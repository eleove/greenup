class CreateLocationPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :location_photos do |t|
      t.references :location, foreign_key: true
      t.string :photo

      t.timestamps
    end
  end
end
