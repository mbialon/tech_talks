class AttendancesController < ApplicationController
	
	def new
		talk_id = params[:talk_id]
		user_id = current_user.id
		if Attendance.where(:talk_id => talk_id, :user_id => user_id).empty?
			@attendance = Attendance.new(:talk_id => talk_id, :user_id => user_id)
			if @attendance.save
				#redirect_to talks_path
				flash[:success] = t 'attendance.success'
			else
				flash[:error] = t 'attendance.error.saving'
			end
		else
			flash[:error] = t 'attendance.error.already_attending'
		end
		
		redirect_to talk_path(talk_id)
		 
	end

end
