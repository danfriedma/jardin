class SessionsController < ApplicationController

skip_before_action :require_user, only: [:new, :create]

# login
def create
	user = User.where(email: params[:session][:email]).first #can do [0] instead of .first

	#persistent hash
	session[:current_user_id] = user.id
	redirect_to users_url

end

# logout
def destroy
    session[:current_user_id] = nil
    redirect_to login_url
end

# form 
def new
end

end
