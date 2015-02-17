class Task < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title
  validates_uniqueness_of :title
end
