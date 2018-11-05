class SessionsController < ApplicationController
  	def new
  	end

  	def create
  		user = User.find_by(email: session_params[:email])
    	if user
    		if user.authenticate(session_params[:password])
    			log_in(user)
    			redirect_to club_path
    		else
    			flash[:danger] = 'Mot de passe incorrect'
    			redirect_to root_path
    		end
	    else
			flash[:danger] = 'Aucun utilisateur enregistré avec cet email'
			redirect_to root_path
		end
	end

	def destroy
	    session.delete(:user_id)
		@current_user = nil
		redirect_to root_path
	end


	private
        
	def session_params
    	params.require(:session).permit(:email, :password)
    end

end
