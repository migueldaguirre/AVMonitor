class CreateRegistros < ActiveRecord::Migration[5.1]
  def change
    create_table :registros do |t|
      t.string :ubicacion
      t.string :producto
      t.string :nivel
      t.string :negociacion
      t.text :comentario
      t.integer :precio
      t.decimal :usd
      t.boolean :aprobado

      t.timestamps
    end
  end
end
