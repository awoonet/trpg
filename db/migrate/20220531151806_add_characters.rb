class AddCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :avatar

      t.integer :age
      t.string :race
      t.string :profession

      t.integer :health
      t.integer :mana

      t.integer :strength
      t.integer :stamina
      t.integer :accuracy
      t.integer :agility
      t.integer :intelligence
      t.integer :wisdom
      t.integer :will
      t.integer :charm

      t.integer :money
      t.bigint :inventory, array: true
      t.bigint :skills, array: true

      t.text :description
      t.text :biography

      t.belongs_to :game
      t.belongs_to :user

      t.timestamps
    end
  end
end
