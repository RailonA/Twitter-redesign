class Opinion < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'

  validates :author_id, presence: true
  validates :text, presence: true, length: { in: 1..200 }

  scope :order_by_most_recent, -> { includes(:user).order(created_at: :desc) }

end
