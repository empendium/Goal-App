class Milestone < ActiveRecord::Base
  belongs_to :goal
  has_many :comments
end
