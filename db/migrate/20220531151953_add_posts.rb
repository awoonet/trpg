class AddPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :content, null: false
      t.bigint :location_to

      t.belongs_to :location
      t.belongs_to :character

      t.timestamps
    end
  end
end
