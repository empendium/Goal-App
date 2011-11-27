class Goal < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :milestone
  
  def self.preset_goals
    ["quit smoking", "lose weight", "run a marathon", "learn to knit", "build an app", "learn to paint", "learn to draw", "save money", "buy a house", "get a job"]
    # "<option>quit smoking</option><option>lose weight</option><option>run marathon</option><option>learn to knit</option>"
  end
  
  def self.category
     ["health and fitness", "lifestyle improvement", "new skill", "education"]
  end

end
