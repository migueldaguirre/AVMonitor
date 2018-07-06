class RemoveProductoFromRegistros < ActiveRecord::Migration[5.1]
  def change
      remove_column :registros, :producto
  end
end
