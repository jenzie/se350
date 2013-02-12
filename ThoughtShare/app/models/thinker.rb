class Thinker < ActiveRecord::Base
  has_many :follows, :foreign_key => "follower_id", :class_name => "Follow"
  has_many :followed, :foreign_key => "followee_id", :class_name => "Follow"
  has_many :thoughts
  has_many :thumbs

  validates :name, :length => { :minimum => 1, :maximum => 35 }, :uniqueness => true
  validates_format_of :name, :with => /\A[A-Z||a-z][-A-Za-z0-9 ']*\Z/

  validates :url, :length => { :maximum => 120 }, :uniqueness => true
  validates_format_of :url, :with => URI::regexp(%w(http https))
  
  validates_format_of :email, :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
end
