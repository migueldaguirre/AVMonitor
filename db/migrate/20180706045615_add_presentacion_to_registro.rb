class AddPresentacionToRegistro < ActiveRecord::Migration[5.1]
  def change
    add_column :registros, :presentacion, :string
  end
end
