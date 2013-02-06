class Song < ActiveRecord::Base
  validates :year, {:numericality => true, :presence => true}
  belongs_to :author
end
