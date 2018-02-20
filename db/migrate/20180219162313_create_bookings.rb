class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :farm, foreign_key: true
      t.boolean :accepted
      t.integer :number_of_people
      t.date :start_time
      t.date :end_time

      t.timestamps
    end
  end
end
