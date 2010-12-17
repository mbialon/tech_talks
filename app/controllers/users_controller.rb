class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @talks = @user.talks.all.paginate(:page => params[:talk_page], :per_page => 5)
  end

end
