class Milestone < ActiveRecord::Base
  belongs_to :goal
  has_many :steps
  accepts_nested_attributes_for :steps
end
