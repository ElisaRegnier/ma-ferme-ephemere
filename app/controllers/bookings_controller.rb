class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.accepted = "Accepté"
    @booking.save
    redirect_to booking_path(@booking)
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.accepted = "Refusé"
    @booking.save
    redirect_to booking_path(@booking)
  end

  def new
    @farm = Farm.find(params[:farm_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.farm = Farm.find(params[:farm_id])
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to farms_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :number_of_people)
  end

end
