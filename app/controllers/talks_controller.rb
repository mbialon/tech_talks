class TalksController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    #@talks = Talk.find :all
    @talks = Talk.find(:all).paginate(:page => params[:page], :per_page => 2)
  end
  
  def show
    @talk = Talk.find(params[:id])
    @users = @talk.users.all.paginate(:page => params[:users_page], :per_page => 2)
    @attachments = @talk.attachments.all.paginate(:page => params[:attachments_page], :per_page => 2)
    @comments = @talk.comments.all.paginate(:page => params[:comments_page], :per_page => 2)
    @attendance = Attendance.new
    @attachment = Attachment.new
  end

  def new
    @talk = Talk.new
  end

  def create
    @talk = Talk.new(params[:talk])
    @talk.user = current_user
    if @talk.save
      redirect_to talk_path(@talk)
    else
      render :action => :new
    end
  end

  def edit
    @talk = Talk.find(params[:id])
    redirect_to talks_path if @talk.user != current_user
  end
  
  def update
    @talk = Talk.find(params[:id])
    redirect_to talks_path if @talk.user != current_user
    @talk.update_attributes(params[:talk])
    if @talk.save
      redirect_to talk_path(@talk)
    else
      render :action => :edit
    end
  end

  def destroy
    @talk = Talk.find(params[:id])
    redirect_to talks_path if @talk.user != current_user
    @talk.destroy
    redirect_to talks_path
  end
end
