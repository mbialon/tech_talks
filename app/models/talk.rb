class Talk < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :abstract

  belongs_to :project
  has_many :comments
  has_many :attendances
  has_many :users, :through => :attendances
  
  has_many :attachments
  has_many :events
  ajaxful_rateable :stars => 5, :dimensions => [:topic, :materials, :host] #, :allow_update => false
  
  belongs_to :user
end
