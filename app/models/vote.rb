class Vote < ApplicationRecord
  validates :uder_id, uniqueness: { scope: :opinion_id }

  belongs_to :user
  belongs_to :opinion
end
