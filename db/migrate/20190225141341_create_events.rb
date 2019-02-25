class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.text :name
      t.references :location, foreign_key: true
      t.datetime :schedule
      t.integer :nb_of_participants
      t.string :photo

      t.timestamps
    end
  end
end
