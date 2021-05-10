module ApplicationHelper
  def like_btn(opinion)
    like = Like.find_by(opinion: opinion, user: current_user)
    link_to('Like!', opinion_likes_path(opinion_id: opinion.id), method: :opinion) if like
  end
end
