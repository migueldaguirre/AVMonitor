task :biologicos  => :environment do
  desc "This task used to create new product from Bioinsumos list"

  path = Rails.root.join('lib', 'seeds', "bioinsumos_2020.csv")

  puts "Creando productos (Lista biológicos)"

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
    puts "#{t.marca} saved"
  end
    puts "Productos biológicos creados en la base de datos"
end

