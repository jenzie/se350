class Follow < ActiveRecord::Base
  belongs_to :follower, :foreign_key => "follower_id", :class_name => "Thinker"
  belongs_to :followee, :foreign_key => "followee_id", :class_name => "Thinker"
end
