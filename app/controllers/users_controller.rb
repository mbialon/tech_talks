class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @talks = @user.talks.all.paginate(:page => params[:talk_page], :per_page => 5)
    
    @createdtalks = Talk.where(:user_id => current_user).paginate(:page => params[:createdtalks_page], :per_page => 5)
    @createdprojects = Project.where(:user_id => current_user).paginate(:page => params[:createdprojects_page], :per_page => 5)
  end

end
