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
    @users = User.all
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
    # @user = current_user
    # @current = @user.current_pin
  end

  def checkin
    # latitude = params(:latitude)
    # longitude = params(:longitude)
    # user = current_user
    # if user.latitude == latitude && user.longitude == longitude
    #   redirect_to trail_pin_path(user.current_trail, user.current_pin)
    # else
    #   flash.now[:error] = "You're not there yet!"
    #   render 'current'
    # end
    #will show you your target latitude and longitude. will have hidden inputs. hidden inputs will be geocoded. maybe will have constant async post telling you how close you are to the place? or maybe constantly telling you what lat/long you are at
    #use watchPosition()!!!!
  end

  private

    def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation)
    end
end
