class Goal < ActiveRecord::Base
  def self.preset_goals
    ["quit smoking", "lose weight", "run marathon", "learn to knit"]
  end
end

