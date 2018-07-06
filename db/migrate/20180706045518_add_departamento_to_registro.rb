class AddDepartamentoToRegistro < ActiveRecord::Migration[5.1]
  def change
    add_column :registros, :departamento, :string
  end
end
