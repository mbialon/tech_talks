class Talk < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :abstract

  belongs_to :user
  has_many :comments
end
