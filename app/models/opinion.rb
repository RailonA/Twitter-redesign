class Opinion < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }

  validates :author_id, presence: true
  validates :text, presence: true, length: { in: 1..200 }end
