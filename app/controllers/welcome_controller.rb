class WelcomeController < ApplicationController
  
  skip_before_filter :require_user
  
  def index
    @preset_goals = Goal.preset_goals
  end
  
  def home
    @comment = Comment.new
    @user = User.find(session[:uid])
    @current_goal = @user.goals.first
    @milestones = @current_goal.milestones.to_a
    @milestone_1 = @milestones[0]
    @milestone_2 = @milestones[1]
    @milestone_3 = @milestones[2]
    if @milestone_1.nil?
      @milestone_1 = Milestone.new(description:"Create a Milestone")
    end
    if @milestone_2.nil?
      @milestone_2 = Milestone.new(description:"Create a Milestone")
    end
    if @milestone_3.nil?
      @milestone_3 = Milestone.new(description:"Create a Milestone")
    end
  end
  
end


