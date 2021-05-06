class FollowingsController < ApplicationController
  before_action :logged_in?

  def index; end
  def create
    @following = current_user.followings.new(followed_id: params[:user_id])
    if @following.save
      flash[:notice] = "You are following #{User.find(params[:user_id]).name}"
    else
      flash[:alert] = 'Something went wrong !'
    end
    redirect_to root_path
  end


  private

  def follow_params
    params.permit(:follower_id, :followed_id)
  end

end
