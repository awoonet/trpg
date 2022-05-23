class SorceryCore < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :email, :string, null: false, index: { unique: true }
    add_column :users, :crypted_password, :string
    add_column :users, :salt, :string
  end
end
