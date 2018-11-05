class UsersController < ApplicationController

before_action :set_user, only: [:show]

  def new
  end

  def show
  end

  def create
  	@user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = "Vous êtes maintenant connecté !"
      redirect_to club_path
    else
      render 'new'
    end
  end

  def index
    if !logged_in?
      flash[:danger] = "Vous devez vous connecter pour accéder au club"
      redirect_to login_path
    else 
      @users = User.all
    end
  end


  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :name, :email, :password, :password_confirmation)
    end

end