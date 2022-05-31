class AddGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :avatar
      t.text :description

      t.boolean :nsfw, default: false
      t.boolean :whitelisted, default: false

      t.bigint :admins, array: true
      t.bigint :whitelist, array: true
      t.bigint :blacklist, array: true

      t.timestamps
    end
  end
end
