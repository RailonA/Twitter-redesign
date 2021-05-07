class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user
      log_in user
      redirect_to root_url
    else
      flash.now[:danger] = "Username doesn't exist"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
