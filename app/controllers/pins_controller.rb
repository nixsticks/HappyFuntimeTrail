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
end
