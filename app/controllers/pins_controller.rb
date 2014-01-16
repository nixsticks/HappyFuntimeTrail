class PinsController < ApplicationController
  def new
    @trail = Trail.find(params[:id])
  end

  def create
  end

  def show
  end

  def index
  end

  def edit
  end

  def update
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
end
