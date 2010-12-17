class AttendancesController < ApplicationController
	
	def create
		talk_id = params[:attendance][:talk_id]
		user_id = current_user.id
		unless Attendance.where(:talk_id => talk_id, :user_id => user_id).nil?
			@attendance = Attendance.new(:talk_id => talk_id, :user_id => user_id)
			if @attendance.save
				#redirect_to talks_path
				flash[:success] = "Zapisano"
			else
				flash[:error] = "Nie zapisano"
			end
		else
			flash[:error] = "Nie zapisano - uzytkownik juz zapisany"  
		end
		redirect_to request.fullpath
	end

end
