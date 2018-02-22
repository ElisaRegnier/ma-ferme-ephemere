class Farm < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings, dependent: :destroy

  validates :photo, presence: true
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, :will_save_change_to_address?
  mount_uploader :photo, PhotoUploader

  REGIONS = ["Toutes les régions", "Basse-Normandie", "Haute-Normandie", "Ile-de-France", "Champagne-Ardenne" ,"Picardie", "Centre", "Bourgogne", "Nord-Pas-de-Calais", "Lorraine", "Alsace", "Franche-Comté", "Pays de la Loire", "Bretagne", "Poitou-Charentes", "Aquitaine", "Midi-Pyrénées", "Limousin","Rhône-Alpes", "Auvergne", "Languedoc-Roussillon", "Provence-Alpes-Côte d'Azur", "Corse"].sort

end
