class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


before_action :require_user

helper_method :current_user
def current_user
    return @user if @user
    user_id = session[:current_user_id]
    

    if user_id
        # like caching user in memory 
        # so we don't have to do a db lookup every time
        @user = User.find(user_id)
        return @user
    else
        return nil
    end

end

#use this method as a filter to block from certain pages
def require_user
    if current_user
        return true
    else
        # find the _url from rake routes
        redirect_to login_url
    end

end

end
