class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @talk = Talk.find(params[:talk_id])
    @comment = @talk.comments.build
  end

  def create
    @talk = Talk.find(params[:talk_id])
    @comment = @talk.comments.build(params[:comment])
    @comment.user = current_user
    if @comment.save
      redirect_to talk_path(@talk)
    else
      render :action => :new
    end
  end
end
