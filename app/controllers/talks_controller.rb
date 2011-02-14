class TalksController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    #@talks = Talk.find :all
    @talks = Talk.find(:all).paginate(:page => params[:page], :per_page => 3)
  end
  
  def show
    @talk = Talk.find(params[:id])
    #@users = @talk.users.all.paginate(:page => params[:users_page], :per_page => 2)
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
  
  def rate
    @talk = Talk.find(params[:id])
    @talk.rate(params[:stars], current_user, params[:dimension])
    #@talk.rate(params[:stars], @talk, params[:dimension])
    average = @talk.rate_average(true, params[:dimension])
    width = (average / @talk.class.max_stars.to_f) * 100
    render :json => {:id => @talk.wrapper_dom_id(params), :average => average, :width => width}
  end
  
  def rateit
    @talk = Talk.find(params[:id])
    render :layout => false
  end
  
  def users_list
    @users = Talk.find(params[:id]).users.all.paginate(:page => params[:users_page], :per_page => 2)
    render :layout => false   
  end
  
  def attachments_list
    @attachments = Talk.find(params[:id]).attachments.all.paginate(:page => params[:attachments_page], :per_page => 2)
    render :layout => false   
  end
  
  def comments_list
    @comments = Talk.find(params[:id]).comments.all.paginate(:page => params[:comments_page], :per_page => 2)
    render :layout => false   
  end
  
  end
