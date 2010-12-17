class AttachmentsController < ApplicationController
	
	def create
		upload = params[:upload]
		name = upload['datafile'].original_filename
		directory = "public/data"
		path = File.join(directory, name)
		File.open(path, "wb") { |f| f.write(upload['datafile'].read)}
		@attachment = Attachment.new(:talk_id => params[:attachment][:talk_id], :path => path)
		if @attachment.save
			render :text => "Zapis udany"
		else
			render :text => "Zapis failed"
		end
    	end
    	
    	def download
    		att = Attachment.find_by_id(params[:id])
    		send_file att.path, :type=>"application/octet-stream"
    	end
		
end
