class AddDataToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :cc, :string
    add_column :users, :role, :string
  end
end
