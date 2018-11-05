class UsersController < ApplicationController
  def new
  end

  def show
  end

  def create
  	@user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = "Vous êtes maintenant connecté !"
      redirect_to user_path(@user)
    else
      render 'new'
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
