class PinsController < ApplicationController
  def new
    @trail = Trail.find(params[:trail_id])
    @pins = @trail.pins.build
  end

  def create
  end

  def show
    @pin = Pin.find(params[:id])
  end

  def index
  end

  def edit
  end

  def update
    @pin = Pin.find(params[:id])
    @pin.update_attributes(pin_params)
    render nothing: true  #AJAX YAY
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
      params.require(:pin).permit(:text, :audio, :video, :photo, :stepnumber, :address, :latitude, :longitude)
    end
end
