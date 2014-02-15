class SessionsController < ApplicationController

skip_before_action :require_action, only[:login]

# login
def create
user = Users.where(email: params[:email]).first #can do [0] instead of .first

#persistent hash
session[:current_user_id] = user.id
redirect_to% users_url

end

# logout
def destroy
    session[:current_user_id] = nil
end

# form 
def new
end

end
