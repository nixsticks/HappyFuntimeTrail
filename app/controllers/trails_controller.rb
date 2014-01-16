class TrailsController < ApplicationController
  # before_action :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
  # before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @trail = Trail.new
  end

  def create
    @trail = Trail.new(trail_params)
    if @trail.save
      flash[:success] = "Trail created!"
      redirect_to @trail
    else
      flash.now[:danger] = "Unable to save trail."
      render 'new'
    end
  end

  def show
    @trail = Trail.find(params[:id])
  end

  def index
    @trails = Trail.all
  end

  def edit
    @trail = Trail.find(params[:id])
  end

  def update
    @trail = Trail.find(params[:id])
    if @trail.update_attributes(trail_params)
      flash[:success] = "Trail updated!"
      redirect_to @trail
    else
      flash.now[:danger] = "Unable to save trail."
      render 'edit'
    end
  end

  def destroy
    Trail.find(params[:id]).destroy
    redirect_to trails_path
  end

  def trail_params
    params.require(:trail).permit(:name, :length, :description, :pins_attributes => [:latitude, :longitude, :address])
  end
end
