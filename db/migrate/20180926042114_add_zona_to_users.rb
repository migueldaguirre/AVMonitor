class AddZonaToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :zona, :string
  end
end
