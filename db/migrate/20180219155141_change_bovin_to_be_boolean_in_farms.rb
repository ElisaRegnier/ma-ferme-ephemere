class ChangeBovinToBeBooleanInFarms < ActiveRecord::Migration[5.1]
  def change
        change_column :farms, :bovin, 'boolean USING bovin::boolean'

  end
end
