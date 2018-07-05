class CreateProductos < ActiveRecord::Migration[5.1]
  def change
    create_table :productos do |t|
      t.string :ica
      t.string :ingrediente
      t.string :marca
      t.string :empresa
      t.string :concentracion
      t.string :formulacion
      t.string :origen

      t.timestamps
    end
  end
end
