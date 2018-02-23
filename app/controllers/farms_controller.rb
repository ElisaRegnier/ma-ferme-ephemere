class FarmsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  skip_before_action :authenticate_user!, only: :show

  def index
    @farms = policy_scope(Farm).order(created_at: :desc)
    authorize @farms

    @farms = @farms.where(regions: params[:query]) if params[:query].present?

    @farms = @farms.where.not(latitude: nil, longitude: nil)
    @markers = @farms.map do |farm|
      {
        lat: farm.latitude,
        lng: farm.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end

  def show
    @booking = Booking.new
    @farm = Farm.find(params[:id])
    authorize @farm
    authorize @booking
  end

  def new
    @farm = Farm.new
    authorize @farm
  end

  def create
    @farm = Farm.new(farms_params)
    @farm.user = current_user
    authorize @farm
    if @farm.save
      redirect_to farm_path(@farm)
    else
      render :new
    end
  end

  def edit
    @farm = Farm.find(params[:id])
    authorize @farm
  end

  def update
    @farm = Farm.find(params[:id])
    @farm.update(farms_params)
    authorize @farm
    redirect_to farm_path(@farm)
  end

  def destroy
    @farm = Farm.find(params[:id])
    authorize @farm
    @farm.destroy
    redirect_to farms_path
  end

  private

  def farms_params
    params.require(:farm).permit(:name, :address, :zip_code, :city, :photo, :description, :ovin, :caprin, :bovin, :size, :regions)
  end
end
