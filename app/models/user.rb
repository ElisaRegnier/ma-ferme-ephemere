class User < ApplicationRecord
  # before_save :default_values

  has_many :farms, dependent: :destroy
  has_many :bookings, dependent: :destroy

  # validates :photo, presence: true
  validates :name, presence: true
  validates :email, format: /@/
  validates :password, length: 6..20
  validates :age, presence: true, allow_nil: true
  validates :location, presence: true, allow_nil: true
  validates :about, presence: true, allow_nil: true

  mount_uploader :photo, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # def default_values
  #   if self.photo.url.nil?
  #     self.photo = Rails.root.join('app/assets/images/cecile.png').open
  #   end
  # end
end
