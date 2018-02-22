class User < ApplicationRecord
  has_one :farm
  has_many :bookings, dependent: :destroy
  has_many :farms, through: :bookings, dependent: :destroy

  validates :photo, presence: true
  validates :name, presence: true
  validates :email, format: /@/
  validates :password, length: 6..20

  mount_uploader :photo, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
