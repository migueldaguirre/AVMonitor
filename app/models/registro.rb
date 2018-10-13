class Registro < ApplicationRecord
  validates :precio, presence: true
  # validates :producto
  validates :negociacion, presence: true
  validates :nivel, presence: true
  # validates :municipio
  validates :presentacion, presence: true

  belongs_to :user
  belongs_to :producto
  belongs_to :municipio

end
