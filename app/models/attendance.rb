class Attendance < ActiveRecord::Base
	belongs_to :user
	belongs_to :talk
	
	validates :user_id, :presence => true
	validates :talk_id, :presence => true
end
