class UsersController < ApplicationController
  def bookings
    @user = current_user
    @bookings = @user.bookings
  end
end
