class Thought < ActiveRecord::Base
  belongs_to :thinker
  has_many :thumbs

  
end
