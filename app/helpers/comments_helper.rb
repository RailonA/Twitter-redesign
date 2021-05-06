module CommentsHelper
    def num_of_comments(opinion)
      Comment.where(opinion_id: opinion).length
    end
  end