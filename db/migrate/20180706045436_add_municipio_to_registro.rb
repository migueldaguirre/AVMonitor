class AddMunicipioToRegistro < ActiveRecord::Migration[5.1]
  def change
    add_column :registros, :municipio, :string
  end
end
