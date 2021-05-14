class OpinionsController < ApplicationController
  before_action :logged_in_user

  def index
    @user = current_user
    @opinion = Opinion.new
    opinions_posts
    suggest_people
  end

  def create
    @opinion = current_user.opinions.build(opinion_params)
    if @opinion.save
      flash[:notice] = 'Opinion was created successfully'
      redirect_to root_path
    elsif opinion_params[:text] == ''
      flash[:alert] = 'Please type something'
      redirect_to root_path
    else
      flash.now[:alert] = 'Something went wrong...'
    end
  end

  private

  def opinions_posts
    @opinions_posts ||= current_user.follow_and_own_opinions.order('created_at DESC')
  end

  def suggest_people
    @suggest_people ||= current_user.follow_suggest.order('created_at DESC')
  end

  def opinion_params
    params.permit(:author_id, :text)
  end
end
