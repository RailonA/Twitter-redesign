class FollowingsController < ApplicationController
  before_action :logged_in_user

  def home; end

  def create
    @following = Following.new(follow_params)
    if @following.save
      flash[:success] = 'Great, now you follow someone new'
      redirect_to '/'
    else
      render 'new'
    end
  end

  private

  def follow_params
    params.permit(:follower_id, :followed_id)
  end
end
