class PagesController < ApplicationController
  def index
    @projects = Project.all.paginate(:page => params[:projects_page], :per_page => 5)
    @talks = Talk.all.paginate(:page => params[:talks_page], :per_page => 5)
  end

end
