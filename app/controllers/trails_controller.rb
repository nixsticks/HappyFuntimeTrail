class TrailsController < ApplicationController
  # before_action :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
  # before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    if current_user
      @trail = Trail.new
      5.times {@trail.pins.build}
    else
      render "shared/not_logged_in"
    end
  end

  def create
    @trail = Trail.new(trail_params)
    if @trail.save
      # @trail.set_trail_image("http://api.webthumbnail.org?width=400&height=500&screen=1024&url=geotreasure")
      @trail.increment_stepnumbers
      @trail.set_length
      @trail.set_popularity
      redirect_to trail_order_pins_path(@trail)
    else
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
    end
  end

  def index
    case params[:order_by]
    when 'popularity'
      @trails = Trail.paginate(page: params[:page], per_page: 3).order('popularity DESC')
    when 'name'
      @trails = Trail.paginate(page: params[:page], per_page: 3).order('name')
    when 'newest'
       @trails = Trail.paginate(page: params[:page], per_page: 3).order('created_at DESC')
    when 'oldest'
      @trails = Trail.paginate(page: params[:page], per_page: 3).order('created_at ASC')
    else 
      @trails = Trail.paginate(page: params[:page], per_page: 3)
    end
  end

  def raw
    @trail = Trail.find(params[:id])
    render :layout => 'raw'
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
      redirect_to trail_order_pins_path(@trail)
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
      params.require(:trail).permit(:name, :length, :description, :creator_id, :pins_attributes => [:id, :name, :latitude, :longitude, :address, :_destroy])
    end
end
