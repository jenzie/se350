class Thought < ActiveRecord::Base
  belongs_to :thinker
  has_many :thumbs
  validates :thought, :length => { :minimum => 5, :maximum => 154 }, :uniqueness => true
  
end
