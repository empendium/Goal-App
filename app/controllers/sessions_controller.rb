class SessionsController < ApplicationController

  skip_before_filter :require_user
  
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if (user && user.authenticate(params[:password]))
      session[:uid] = user.id
      redirect_to welcome_home_path, :notice => "Welcome"
    else
      flash[:notice] = "Please try again."
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_url
  end

end