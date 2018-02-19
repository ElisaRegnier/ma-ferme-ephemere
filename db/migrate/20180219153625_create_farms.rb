class CreateFarms < ActiveRecord::Migration[5.1]
  def change
    create_table :farms do |t|
      t.string :name
      t.string :ovin
      t.string :address
      t.text :description
      t.string :bovin
      t.string :caprin
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
