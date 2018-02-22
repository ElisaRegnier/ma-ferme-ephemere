class Farm < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings, dependent: :destroy

  validates :photo, presence: true
  validates :name, presence: true, uniqueness: true, length: { in: 6..18 }
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  mount_uploader :photo, PhotoUploader
end
