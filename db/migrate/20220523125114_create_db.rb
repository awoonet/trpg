class CreateDb < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :email, null: false, index: { unique: true }
      t.string :avatar
      t.string :theme, default: "default"
      t.boolean :is_admin, default: false
      
      t.string :crypted_password
      t.string :salt

      t.timestamps
    end

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
    
    create_table :locations do |t|
      t.string :name, null: false
      t.text :description
      t.string :avatar

      t.belongs_to :game

      t.timestamps
    end

    create_table :posts do |t|
      t.text :content, null: false
      t.belongs_to :location
      t.belongs_to :character

      t.timestamps
    end

    create_table :items do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :type
      t.text :description

      t.belongs_to :game

      t.timestamps
    end

    create_table :skills do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :type
      t.text :description

      t.belongs_to :game

      t.timestamps
    end
  end
end
