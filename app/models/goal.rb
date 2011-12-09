class Goal < ActiveRecord::Base
  
  belongs_to :user
  has_many :milestones
  accepts_nested_attributes_for :milestones 
  
  def self.preset_goals
    ["quit smoking", "start a business", "lose weight", "make a movie", "write a novel", "write a play", "get a raise", "run a marathon", "learn to knit", "build an app", "learn to paint", "learn to draw", "save money", "buy a house", "get a job"]
    # "<option>quit smoking</option><option>lose weight</option><option>run marathon</option><option>learn to knit</option>"
  end
  
  def self.category
     ["health and fitness", "lifestyle improvement", "new skill", "education"]
  end

end
