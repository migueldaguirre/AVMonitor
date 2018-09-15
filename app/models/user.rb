class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :name, presence: true
  validates :cc, presence: true
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :registros
end
