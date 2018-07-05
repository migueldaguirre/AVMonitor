# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

path = Rails.root.join('lib', 'seeds', "glifosato_demo.csv")

CSV.foreach(path, :headers => true, encoding: "UTF-8") do |row|

  t = Producto.new
  t.ica = row['ica']
  t.ingrediente = row['ingrediente']
  t.marca = row['marca']
  t.empresa = row['empresa']
  t.concentracion = row['concentracion']
  t.formulacion = row['formulacion']
  t.origen = row['origen']
  t.save
  puts "#{t.marca} saved"
end

