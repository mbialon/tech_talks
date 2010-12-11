class Comment < ActiveRecord::Base
  validates_presence_of :text

  belongs_to :talk
  belongs_to :user
end
