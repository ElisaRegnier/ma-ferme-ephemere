class ChangeCaprinToBeBooleanInFarms < ActiveRecord::Migration[5.1]
  def change
    change_column :farms, :caprin, 'boolean USING caprin::boolean'

  end
end
