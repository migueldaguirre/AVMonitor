class Registro < ApplicationRecord
  validates :precio, presence: true
  validates :producto, presence: true
  validates :ubicacion, presence: true
  validates :negociacion, presence: true
  # validates :nivel, presence: true
end
