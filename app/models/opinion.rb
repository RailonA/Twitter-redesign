class Opinion < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'

  validates :author_id, presence: true
  validates :text, presence: true, length: { in: 1..200 }
end
