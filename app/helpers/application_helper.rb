module ApplicationHelper


    def like_btn(opinion)
        like = Like.find_by(opinion: opinion, user: current_user)
        if like
          link_to('Like!', opinion_likes_path(opinion_id: opinion.id), method: :opinion)
        end
      end
end
