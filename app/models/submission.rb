class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :problem
  
  attr_accessible :script
  
  validates :user_id, :presence => true
  validates :problem_id, :presence => true    
  
  default_scope :order => 'submissions.created_at desc'
end
