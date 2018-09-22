class RemoveDepartamentoFromRegistros < ActiveRecord::Migration[5.1]
  def change
    remove_column :registros, :departamento, :string
  end
end
