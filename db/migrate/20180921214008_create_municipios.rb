class CreateMunicipios < ActiveRecord::Migration[5.1]
  def change
    create_table :municipios do |t|
      t.string :region
      t.string :cod_departamento
      t.string :departamento
      t.string :cod_municipio
      t.string :nombre_municipio

      t.timestamps
    end
  end
end
