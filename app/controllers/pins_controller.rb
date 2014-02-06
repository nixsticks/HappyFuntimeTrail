class PinsController < ApplicationController
  def new
    @trail = Trail.find(params[:trail_id])
    @pins = @trail.pins.build
  end

  def create
  end

  def show
    @trail = Trail.find(params[:trail_id])
    @pin = @trail.pins.find_by_stepnumber(params[:id])
    if @pin.authorized?(current_user)
      render 'show'
    else
      render 'unauthorized'
    end
  end

  def index
  end

  def edit
  end

  def update
    @pin = Pin.find(params[:id])
    @pin.update_attributes(pin_params)
    render nothing: true
  end

  def destroy
  end

  def sort
    params[:pin].each_with_index do |id, index|
      Pin.update_all({stepnumber: index+1}, {id: id})
    end
    render nothing: true
  end

  def order
    @trail = Trail.find(params[:trail_id]) 
    @pins = @trail.pins.order(:stepnumber)
    render partial: 'shared/pins_div'
  end

  private 

    def pin_params
      params.require(:pin).permit(
        :stepnumber,
        :address,
        :latitude,
        :longitude,
        :texts_attributes => [:id, :content, :user_id, :pin_id],
        :images_attributes => [:id, :user_id, :pin_id, :attachment],
        :audios_attributes => [:id, :user_id, :pin_id, :attachment],
        :videos_attributes => [:id, :user_id, :pin_id, :attachment]
      )
    end
end