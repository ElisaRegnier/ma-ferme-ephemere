class AddPhotoToFarms < ActiveRecord::Migration[5.1]
  def change
    add_column :farms, :photo, :string
  end
end
