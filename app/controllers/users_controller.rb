class UsersController < ApplicationController

def new
   if session[:user_id]
    redirect_to(:controller => 'projects')
  else
    @user = User.new
  end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "User registred"
      flash[:color]= "valid"
      redirect_to :controller => 'sessions', :action => 'login'
    else
      flash[:notice] = "Wrong details"
      flash[:color]= "invalid"
    end
    render "new"
  end
end
