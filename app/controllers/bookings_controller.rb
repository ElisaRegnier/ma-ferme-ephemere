class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def create
  end

  def new
  end

  def edit
  end

  def update
    @booking = Booking.find(params[:id])



    @booking.save
    redirect_to booking_path(@booking)
  end

  def destroy
  end
end
