class Goal < ActiveRecord::Base
  
  belongs_to :user
  has_many :milestones
  accepts_nested_attributes_for :milestones 
  
  def self.preset_goals
    ["quit smoking", "get organized", "learn a musical instrument", "learn to drive", "overcome a fear", "overcome an addiction", "learn to cook", "learn to program", "learn to sew", "learn a sport", "learn a foreign language", "take a trip", "reconnect with old friends", "find birth-parents", "take a class", "get a degree", "learn to dance", "start a business", "lose weight", "make a movie", "write a book", "write a play", "get a raise", "run a marathon", "learn to knit", "build an app", "learn to paint", "learn to draw", "save money", "buy a house", "get a job"]
    # "<option>quit smoking</option><option>lose weight</option><option>run marathon</option><option>learn to knit</option>"
  end
  
  def self.category
     ["health and fitness", "lifestyle improvement", "career development", "athletic skills", "other skills" "creative skills", "education"]
  end

end
