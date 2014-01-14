class UsersController < ApplicationController
  def new
    @user = User.find(params[:id])
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
