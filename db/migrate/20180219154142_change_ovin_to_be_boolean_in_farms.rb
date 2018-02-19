class ChangeOvinToBeBooleanInFarms < ActiveRecord::Migration[5.1]
  def change
    change_column :farms, :ovin, 'boolean USING ovin::boolean'
  end
end
