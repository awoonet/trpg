class CreateDb < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :email, null: false, index: { unique: true }
      t.boolean :is_admin, default: false
      
      t.string :crypted_password
      t.string :salt

      t.timestamps
    end

    create_table :games do |t|
      t.string :name

      t.timestamps
    end

    create_table :games_admins do |t|
      t.belongs_to :game, foreign_key: true, index: true
      t.belongs_to :admin, class_name: 'User', foreign_key: { to_table: :users }, index: true
    end

    create_table :characters do |t|
      t.string :name
      t.belongs_to :game
      t.belongs_to :user

      t.timestamps
    end
    
    create_table :locations do |t|
      t.string :name
      t.belongs_to :game

      t.timestamps
    end

    create_table :posts do |t|
      t.text :content
      t.belongs_to :location
      t.belongs_to :character

      t.timestamps
    end
  end
end
