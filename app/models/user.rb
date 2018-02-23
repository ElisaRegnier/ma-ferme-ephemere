class User < ApplicationRecord
  has_many :farms, dependent: :destroy
  has_many :bookings, dependent: :destroy

  # validates :photo, presence: true
  validates :name, presence: true
  validates :email, format: /@/
  validates :age, presence: true, allow_nil: true
  validates :location, presence: true, allow_nil: true
  validates :about, presence: true, allow_nil: true

  mount_uploader :photo, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
