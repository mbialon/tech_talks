class AttendancesController < ApplicationController
	
	def create
		talk_id = params[:talk_id]
		user_id = current_user.id
		if Attendance.where(:talk_id => talk_id, :user_id => user_id).nil?
			@attendance = Attendance.new(:talk_id => talk_id, :user_id => user_id)
			if @attendance.save
				#redirect_to talks_path
				flash[:success] = "Zapisano"
			else
				flash[:error] = "Nie zapisano"
			end
		else
			flash[:error] = "Nie zapisano - uzytkownik juz zapisany"
			render :text => "User istnieje"
		end
		 
	end

end
