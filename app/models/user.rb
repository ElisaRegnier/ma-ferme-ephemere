class User < ApplicationRecord
  has_one :farm
  has_many :bookings
  has_many :farms, through: :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
