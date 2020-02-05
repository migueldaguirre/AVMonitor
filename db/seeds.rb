# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

path = Rails.root.join('lib', 'seeds', "productos_ica2.csv")


puts "Reiniciando base de datos de productos..."
Producto.destroy_all
Municipio.destroy_all

puts "Creando productos (Lista ICA)"

CSV.foreach(path, :headers => true, encoding: "UTF-8") do |row|
  t = Producto.new
  t.ica = row['ica']
  t.ingrediente = row['ingrediente']
  t.marca = row['marca']
  t.empresa = row['empresa']
  t.concentracion = row['concentracion']
  t.formulacion = row['formulacion']
  t.origen = row['origen']
  t.save!
  # puts "#{t.marca} saved"
end

puts "Productos creados en la base de datos"


r = Municipio.new
r.cod_departamento = "0"
r.departamento = "No definido"
r.cod_municipio = "0"
r.nombre_municipio = "No definido"
r.save!

require 'soda/client'

puts "Consultando API de Departamentos de Colombia"

client = SODA::Client.new({:domain => "www.datos.gov.co", :app_token => "AUTH"})

results = client.get("p95u-vi7k", :$limit => 5000)


puts "Se obtuvo #{results.count} resultados (lista de municipios)"
results.each do |k, v|
  m = Municipio.new
  m.cod_departamento = "#{k.c_digo_dane_del_departamento}"
  m.departamento = "#{k.departamento}"
  m.cod_municipio = "#{k.c_digo_dane_del_municipio}"
  m.nombre_municipio = "#{k.municipio}"
  m.save!
end
