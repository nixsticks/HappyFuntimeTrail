class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Happy Funtime Trail!"
      redirect_to @user, notice: 'Your profile was succesfully created!'
    else
      render action: "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user
    else
      render action: "edit"
    end
  end

  def destroy
    @user.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  def current
    if current_user
      @user = current_user
      @pin = @user.current_pin
      render action: 'current'
    else
      render 'shared/not_logged_in'
    end
  end

  def checkin
    @user = current_user
    @trail = current_user.current_trail
    @pin = @user.current_pin
    if @user.correct_location?(params[:latitude], params[:longitude])
      @trail.next_pin(@pin, @user)
      redirect_to trail_pin_path(@trail, @pin.stepnumber)
    else
      flash.now[:error] = "You're not there yet!"
      render 'current'
    end
  end

  def abandon
    current_user.stop_trail
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :avatar, :current_trail_id, :current_pin_id, :email, :password, :password_confirmation)
    end
end
