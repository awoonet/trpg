class AddBelongings < ActiveRecord::Migration[7.0]
  def change
    create_table :belongings do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :kind
      t.text :description
      
      t.string :type
      t.belongs_to :game

      t.timestamps
    end
  end
end
