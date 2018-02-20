class FarmsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  skip_before_action :authenticate_user!, only: :show

  def index
    @farms = Farm.all
  end

  def show
    @farm = Farm.find(params[:id])
  end

  def new
    @farm = Farm.new
  end

  def create
    @farm = Farm.new(farms_params)
    @farm.user = current_user
    if @farm.save
      redirect_to farm_path(@farm)
    else
      render :new
    end
  end

  def edit
    @farm = Farm.find(params[:id])
  end

  def update
    @farm = Farm.find(params[:id])
    @farm.update(farms_params)
    redirect_to farm_path(@farm)
  end

  def destroy
    @farm = Farm.find(params[:id])
    @farm.destroy
    redirect_to farms_path
  end

  private

  def farms_params
    params.require(:farm).permit(:name, :address)
  end
end
