class Farm < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings, dependent: :destroy

  validates :photo, presence: true
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :regions, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  mount_uploader :photo, PhotoUploader

  REGIONS = ["Basse-Normandie", "Aquitaine", "Bourgogne", "Ile-de-France", "Champagne-Ardenne", "Picardie", "Haute-Normandie", "Centre", "Basse-Normandie", "Bourgogne", "Nord-Pas-de-Calais", "Lorraine", "Alsace", "Franche-Comté", "Pays de la Loire", "Bretagne", "Poitou-Charentes", "Aquitaine", "Midi-Pyrénées", "Limousin", "Rhône-Alpes", "Auvergne"]
end
