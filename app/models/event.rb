class Event < ActiveRecord::Base
  validates_presence_of :scheduled_at
  validates_presence_of :talk
  validates_presence_of :user

  belongs_to :talk
  belongs_to :user
end
