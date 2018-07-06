class RemoveUbicacionFromRegistros < ActiveRecord::Migration[5.1]
  def change
    remove_column :registros, :ubicacion, :string
  end
end
