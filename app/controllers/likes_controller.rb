class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(opinion_id: params[:opinion_id])

    if @like.save
      redirect_to opinions_path, notice: 'You liked this opinion.'
    else
      redirect_to opinions_path, alert: 'You cannot like this opinion.'
    end
  end

  def destroy
    like = Like.find_by(id: params[:id], user: current_user, opinion_id: params[:opinion_id])
    if like
      like.destroy
      redirect_to opinions_path, notice: 'You disliked a opinion.'
    else
      redirect_to opinions_path, alert: 'You cannot dislike opinion that you did not like before.'
    end
  end
end
