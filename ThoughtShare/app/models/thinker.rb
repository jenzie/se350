class Thinker < ActiveRecord::Base
  has_many :follows, :foreign_key => "follower_id", :class_name => "Follow"
  has_many :followed, :foreign_key => "followee_id", :class_name => "Follow"
  has_many :thoughts
  has_many :thumbs

  
end
