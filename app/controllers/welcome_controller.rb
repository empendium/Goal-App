class WelcomeController < ApplicationController
  def index
    @preset_goals = Goal.preset_goals
  end
end


