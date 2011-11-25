class ApplicationController < ActionController::Base
 
  
  protect_from_forgery
  before_filter :require_user #for every controller, require this filter
  
  def require_user
    if session[:uid].blank?
      redirect_to signin_url, :notice => "Please sign in first."
      return
    end
    
    @user = User.find(session[:uid])
  end
  
end