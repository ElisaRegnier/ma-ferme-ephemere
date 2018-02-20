class ChangeAcceptedToStringTypeInBookings < ActiveRecord::Migration[5.1]
  def change
    change_column :bookings, :accepted, :string, default: "En attente"
  end
end
