class AddSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
      t.string :name, null: false
      t.string :kind
      t.text :description
      
      t.belongs_to :game

      t.timestamps
    end
  end
end
