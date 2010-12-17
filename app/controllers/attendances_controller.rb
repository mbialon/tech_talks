class AttendancesController < ApplicationController
	
	def create
		@attendance = Attendance.new(params[:attendance])
		if @attendance.save
			redirect_to talks_path
		else
			redirect_to @user
		end
	end

end
