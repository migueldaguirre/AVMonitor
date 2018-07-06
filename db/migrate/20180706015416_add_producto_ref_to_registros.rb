class AddProductoRefToRegistros < ActiveRecord::Migration[5.1]
  def change
    add_reference :registros, :producto, foreign_key: true
  end
end
