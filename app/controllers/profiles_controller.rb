class ProfilesController < ApplicationController

  skip_after_action :verify_authorized

  def show
    @user = User.find(params[:id])
  end

  def edit

  end

  def update
  end

  def destroy
  end
end
