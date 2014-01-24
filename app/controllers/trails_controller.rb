class TrailsController < ApplicationController
  # before_action :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
  # before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @trail = Trail.new
    3.times {@trail.pins.build}
  end

  def create
    @trail = Trail.new(trail_params)
    if @trail.save
      flash[:success] = "Trail created!"
      @trail.increment_stepnumbers
      @trail.set_length
      redirect_to trail_order_pins_path(@trail)
    else
      flash.now[:error] = "Unable to save trail."
      render 'new'
    end
  end

  def show
    @trail = Trail.find(params[:id])
  end

  def start
    @user = current_user
    trail = Trail.find(params[:id])
    if @user.start(trail)
      redirect_to current_path
    else
      flash.now[:error] = 'Something went wrong!'
      render 'show'
    endn
  end

  def index
    @trails = Trail.all
  end

  def order_pins
    @trail = Trail.find(params[:id])
    @pins = @trail.pins.order(:stepnumber)
    authorize('order_pins')
  end

  def edit
    @trail = Trail.find(params[:id])
    authorize('edit')
  end

  def update
    @trail = Trail.find(params[:id])
    if @trail.update_attributes(trail_params)
      flash[:success] = "Trail updated!"
      redirect_to @trail
    else
      flash.now[:error] = "Unable to save trail."
      render 'edit'
    end
  end

  def destroy
    Trail.find(params[:id]).destroy
    redirect_to trails_path
  end

  def add_media
    @trail = Trail.find(params[:id])
    @pins = @trail.pins
    authorize('add_media')
  end

  def win
    @trail = Trail.find(params[:id])
  end

  private 

    def trail_params
      params.require(:trail).permit(:name, :length, :description, :creator_id, :pins_attributes => [:id, :latitude, :longitude, :address, :_destroy])
    end

end
