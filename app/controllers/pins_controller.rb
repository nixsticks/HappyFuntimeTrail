class PinsController < ApplicationController
  def new
    @trail = Trail.find(params[:trail_id])
    @pins = @trail.pins.build
  end

  def create
  end

  def show
    @pin = Pin.find_by_stepnumber(params[:id])
    
  end

  def index
  end

  def edit
  end

  def update
    @pin = Pin.find(params[:id])
    @pin.update_attributes(pin_params)
    redirect_to trail_pin_path(@pin.trail, @pin.stepnumber)
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
    render partial: 'trails/pin_div'
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
