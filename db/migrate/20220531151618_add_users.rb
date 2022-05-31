class AddUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :email, null: false, index: { unique: true }
      t.string :avatar
      t.string :theme, default: "flatly"
      t.boolean :is_admin, default: false
      
      t.string :crypted_password
      t.string :salt

      t.timestamps
    end
  end
end
