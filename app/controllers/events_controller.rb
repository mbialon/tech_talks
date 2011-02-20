class EventsController < ApplicationController
  def new
    @talk = Talk.find params[:talk_id]
    @event = Event.new
  end

  def create
    @talk = Talk.find params[:talk_id]
    @event = @talk.events.build params[:event]
    if @event.save
      redirect_to talk_path(@talk)
    else
      render :action => :new
    end
  end

  def edit
    @talk = Talk.find params[:talk_id]
    @event = @talk.events.find params[:id]
  end

  def update
    @talk = Talk.find params[:talk_id]
    @event = @talk.events.find params[:id]
    @event.update_attributes params[:event]
    if @event.save
      redirect_to talk_path(@talk)
    else
      render :action => :edit
    end
  end

  def destroy
    @talk = Talk.find params[:talk_id]
    @event = @talk.events.find params[:id]
    @event.destroy
    redirect_to talk_path(@talk)
  end
end
