class AddZipCodeAndCityToFarms < ActiveRecord::Migration[5.1]
  def change
    add_column :farms, :zip_code, :float
    add_column :farms, :city, :string
  end
end
