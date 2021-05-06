class User < ApplicationRecord
    has_one_attached :photo
    has_one_attached :cover_image
  
    validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 12 }
    validates :name, presence: true, length: { minimum: 5, maximum: 20 }
  
    has_many :opinions, foreign_key: 'author_id'
    has_many :comments, dependent: :destroy
    has_many :followings, class_name: 'Following', foreign_key: 'follower_id'
    has_many :follows, through: :followings, source: :followed
    has_many :inverse_followings, class_name: 'Following', foreign_key: 'followed_id'
    has_many :followers, through: :inverse_followings, source: :follower
  
    def who_to_follow
      User.where.not(id: id).where.not(id: follows).order('created_at DESC')
    end

    def follow_suggest
      User.where.not(id: followers).where.not(id: id)
    end
  
    def follow_and_own_opinions
      Opinion.where(author_id: self).or(Opinion.where(author_id: followers))
    end
  end