class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from ActiveRecord::RecordNotFound, :with => :rescue404
 rescue_from ActionController::RoutingError, :with => :rescue404
 rescue_from ActionController::UnknownController,  :with => :rescue404

before_filter :authenticate_user, :only => [:index, :edit, :destroy, :logout]

def authenticate_user
    unless session[:user_id]
      redirect_to(:controller => 'sessions', :action => 'login')
      return false
    else
      # set current_user by the current user object
      @current_user = User.find session[:user_id]
      return true
    end
  end

def rescue404
    render  'public/404.html'
  end
  #method for preventing user to access Signup & Login Page without logout
  def save_login_state
    if session[:user_id]
       @global_session= User.find session[:user_id]
        return false
    else
      return true
    end
  end
end
