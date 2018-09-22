class Municipio < ApplicationRecord
  has_many :registros, dependent: :destroy


  def municipio_departamento
      "#{nombre_municipio}, (#{departamento})"
  end

  def departamento_municipio
    "#{departamento}, (#{municipio})"
  end

end

