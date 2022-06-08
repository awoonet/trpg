class AddGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :avatar
      t.text :description

      t.boolean :nsfw, default: false
      t.boolean :whitelisted, default: false
      
      t.bigint :game_master
      t.bigint :admins, array: true
      t.bigint :whitelist, array: true
      t.bigint :blacklist, array: true
      
      t.integer :max_health
      t.integer :max_energy
      t.integer :max_stat

      t.timestamps
    end
  end
end
