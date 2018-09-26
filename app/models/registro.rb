class Registro < ApplicationRecord
  validates :precio, presence: true
  validates :producto, presence: true
  validates :negociacion, presence: true
  validates :nivel, presence: true
  # validates :municipio, presence: false
  validates :presentacion, presence: true


  belongs_to :user
  belongs_to :producto
  belongs_to :municipio

end
