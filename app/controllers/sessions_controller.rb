class SessionsController < ApplicationController

skip_before_action :require_user, only: [:new, :create]

# login
def create

	if (params[:session][:email] == "")
		render 'sessions/new'
	else
	user = User.where(email: params[:session][:email]).first #can do [0] instead of .first

	#persistent hash
	session[:current_user_id] = user.id
	redirect_to root_path
	end
end

# logout
def destroy
    session[:current_user_id] = nil
    redirect_to login_path
end

# form 
def new
end

end
