class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]

  def show
    @user = current_user
    @user2 = User.find(params[:id])
    @opinions = Opinion.where(author_id: @user).order_by_most_recent
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'Welcome to the app!'
      redirect_to '/'
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :photo, :cover_image)
  end
end
