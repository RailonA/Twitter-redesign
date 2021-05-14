class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def logged_in_user
    return unless logged_in? == false

    store_location
    flash[:danger] = 'Please log in.'
    redirect_to login_url
  end
end
