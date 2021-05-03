class OpinionsController < ApplicationController
    before_action :logged_in_user
  
    def home
      @user = current_user
      @opinion = Opinion.new
      opinions_posts
      suggest_people
    end
  
    def create
      @opinion = Opinion.new(opinion_params)
      if @opinion.save
        redirect_to '/'
      else
        render 'new'
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