class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.text :name
      t.references :user, foreign_key: true
      t.text :description
      t.float :latitude
      t.float :longitude
      t.string :flag_color
      t.string :garbage, array: true, default: []

      t.timestamps
    end
  end
end
