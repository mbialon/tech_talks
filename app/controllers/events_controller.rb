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
end
