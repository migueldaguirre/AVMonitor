class Producto < ApplicationRecord
  has_many :registros, dependent: :destroy
end
