class AttachmentsController < ApplicationController
	
	def create
		upload = params[:upload]
		talk_id = params[:talk_id]
		if upload.nil?
			flash[:failure] = "Nie wskazano pliku do zapisania"
		else
			name = upload['datafile'].original_filename
			directory = "public/data"
			path = File.join(directory, name)
			File.open(path, "wb") { |f| f.write(upload['datafile'].read)}
			@attachment = Attachment.new(:talk_id => talk_id, :path => path, :filename => name)
			if @attachment.save
				flash[:success] = "Udalo sie"
			else
				flash[:failure] = "Zapis nieudany!"
			end
		end
		redirect_to talk_path(talk_id)
	end
    	
    	def download
    		att = Attachment.find_by_id(params[:id])
    		send_file att.path, :type=>"application/octet-stream"
    	end
		
end
