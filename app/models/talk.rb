class Talk < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :abstract

  belongs_to :user
  has_many :comments
  has_many :attendances
  has_many :users, :through => :attendances
  
  has_many :attachments
end
