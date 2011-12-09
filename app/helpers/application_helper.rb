module ApplicationHelper
  def signed_in?
    if session[:uid]
      return true
    else
      return false
    end
  end
  
  def current_user
    User.find(session[:uid])
  end
end
