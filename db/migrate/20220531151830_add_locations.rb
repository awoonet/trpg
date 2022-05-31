class AddLocations < ActiveRecord::Migration[7.0]
  def change    
    create_table :locations do |t|
      t.string :name, null: false
      t.text :description
      t.string :avatar
      t.bigint :parent_location_id, default: nil
      t.bigint :child_locations_ids, array: true, default: []

      t.belongs_to :game

      t.timestamps
    end
  end
end
