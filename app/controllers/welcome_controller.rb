class WelcomeController < ApplicationController
  
  skip_before_filter :require_user
  
  def index
    @preset_goals = Goal.preset_goals
  end
  
  def home
    @user = User.find(session[:uid])
    @current_goal = @user.goals.first
  end
  
end


