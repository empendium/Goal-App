class GoalsController < ApplicationController
  
  skip_before_filter :require_user
  
  # GET /goals
  # GET /goals.json
  def index
    @goals = Goal.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @goals }
    end
  end

  # GET /goals/:id
  # GET /goals/1
  # GET /goals/1.json
  def show
    @goal = Goal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @goal }
    end
  end

  # GET /goals/new
  # GET /goals/new.json
  def new
    @goal_new = params[:goal]
    @goal = Goal.new(name: @goal_new)
    @category = Goal.category
    
  
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @goal }
    end
  end

  # GET /goals/1/edit
  def edit
    @goal = Goal.find(params[:id])
    
    if @goal.milestones.count != 3
      3.times do
        milestone = @goal.milestones.build
        1.times { milestone.steps.build}
      end
    end     
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /goals
  # POST /goals.json
  def create
    @goal = Goal.new(params[:goal])
    @user = User.find(session[:uid])
    @goal.user = @user #This associates the current user with their new goal. 
                       #After the goal is saved, the User ID is placed in the Goal Table's User ID column. 
    respond_to do |format|
      if @goal.save
        format.html { redirect_to welcome_home_path, notice: 'Goal was successfully created.' }
        format.json { render json: @goal, status: :created, location: @goal }
      else
        format.html { render action: "new" }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /goals/1
  # PUT /goals/1.json
  def update
    @goal = Goal.find(params[:id])

    respond_to do |format|
      if @goal.update_attributes(params[:goal])
        format.html { redirect_to @goal, notice: 'Goal was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy

    respond_to do |format|
      format.html { redirect_to goals_url }
      format.json { head :ok }
    end
  end
end
