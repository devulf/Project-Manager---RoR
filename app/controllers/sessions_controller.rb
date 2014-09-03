require 'bcrypt'
class SessionsController < ApplicationController
 include BCrypt

def login
     if session[:user_id]
         redirect_to(:controller => 'projects')
  else
    #Login Form
  end
end

  def login_attempt
    authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
    if authorized_user
      session[:user_id] = authorized_user.id
      redirect_to(:controller => 'projects')
    else
      flash[:invalid_login] = "Invalid Username or Password"
      flash[:color]= "invalid"
     end
  end

def logout
    session[:user_id] = nil
    redirect_to :action => 'login'
  end
end
