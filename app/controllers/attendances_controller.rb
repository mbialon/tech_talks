class AttendancesController < ApplicationController
	
	def new
		talk_id = params[:talk_id]
		user_id = current_user.id
		if Attendance.where(:talk_id => talk_id, :user_id => user_id).nil?
			@attendance = Attendance.new(:talk_id => talk_id, :user_id => user_id)
			if @attendance.save
				#redirect_to talks_path
				flash[:success] = "Zostałeś zapisany na kurs"
			else
				flash[:error] = "Zapis na kurs nie powiódł się"
			end
		else
			flash[:error] = "Jesteś już zapisany na ten kurs"
		end
		
		redirect_to talk_path(talk_id)
		 
	end

end
