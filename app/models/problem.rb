class Problem < ActiveRecord::Base
  has_many :submissions, :dependent => :destroy
  
  validates :title, :presence => true
  validates :description, :presence => true
  validates :par_score, :presence => true, :numericality => true
  
  attr_accessible :title, :description, :par_score, :language, :current_problem, :sample_output, :deadline
end
