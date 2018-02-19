class AddSizeToFarms < ActiveRecord::Migration[5.1]
  def change
    add_column :farms, :size, :integer
  end
end
