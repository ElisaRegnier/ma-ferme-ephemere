class RemoveRegionFromFarms < ActiveRecord::Migration[5.1]
  def change
    remove_column :farms, :region, :string
  end
end
