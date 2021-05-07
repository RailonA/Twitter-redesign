module VotesHelper
  def num_of_votes(opinion)
    Vote.where(opinion_id: opinion).length
  end
end
