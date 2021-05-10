module LikesHelper
  def num_of_likes(opinion)
    Like.where(opinion_id: opinion).length
  end
end
