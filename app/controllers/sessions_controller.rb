class SessionsController < ApplicationController

  skip_before_filter :require_user
  
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if (user && user.authenticate(params[:password]))
      session[:uid] = user.id
      redirect_to root_url, :notice => "Thanks for signing in!"
    else
      flash[:notice] = "No way"
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_url
  end

end