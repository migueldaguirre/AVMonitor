class Municipio < ApplicationRecord
  has_many :registros, dependent: :destroy


def municipio_departamento
    "#{nombre_municipio}, (#{departamento})"
end

end

