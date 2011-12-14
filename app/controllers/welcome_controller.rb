class WelcomeController < ApplicationController
  
  skip_before_filter :require_user
  
  def index
    @preset_goals = Goal.preset_goals
  end
  
  def home
    @comment = Comment.new
    @user = User.find(session[:uid])
    @current_goal = @user.goals.first
    
    @related_milestones = Milestone.joins(:goal)
      .where('goals.category' => @current_goal.category)
      .where('goals.id !=?', @current_goal.id)
    
    @related_milestones_ids = @related_milestones.map {|milestone| milestone.id }
    @related_comments = Comment.where(milestone_id: @related_milestones_ids)
        .order('created_at DESC')
        .where(:created_at => (Time.now - 5.days)...(Time.now))
        .limit(10)
        
        
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
    @comments = Comment.where(:milestone_id => [@milestone_1.id, @milestone_2.id, @milestone_3.id])
      .order('created_at DESC')
      .where(:created_at => (Time.now - 5.days)...(Time.now))
  end
end


