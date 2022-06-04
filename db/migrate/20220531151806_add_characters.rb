class AddCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name, null: false
      t.string :avatar

      t.integer :age
      t.string :race
      t.string :profession

      t.integer :health
      t.integer :max_health
      t.integer :energy
      t.integer :max_energy

      t.integer :strength,      default: 0
      t.integer :stamina,       default: 0
      t.integer :accuracy,      default: 0
      t.integer :agility,       default: 0
      t.integer :intelligence,  default: 0
      t.integer :wisdom,        default: 0
      t.integer :will,          default: 0
      t.integer :charm,         default: 0

      t.integer :money,         default: 0
      t.bigint :item_ids, array: true
      t.bigint :skill_ids, array: true

      t.text :description
      t.text :biography

      t.belongs_to :game
      t.belongs_to :user

      t.timestamps
    end
  end
end
