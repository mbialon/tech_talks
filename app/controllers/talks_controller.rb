class TalksController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]

  def index
    @talks = Talk.find :all
  end

  def new
    @talk = Talk.new
  end

  def create
    @talk = Talk.new(params[:talk])
    @talk.user = current_user
    @talk.save
    redirect_to talks_path
  end
end
