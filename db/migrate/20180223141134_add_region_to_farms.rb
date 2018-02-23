class AddRegionToFarms < ActiveRecord::Migration[5.1]
  def change
    add_column :farms, :region, :string
  end
end
