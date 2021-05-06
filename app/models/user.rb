class User < ApplicationRecord
    has_many :opinions, foreign_key: 'author_id'
    has_many :votes

    has_one_attached :photo
    has_one_attached :cover_image

    has_many :followerships, class_name: 'Following', foreign_key: :follower_id
    has_many :inverse_followerships, class_name: 'Following', foreign_key: :followed_id, dependent: :delete_all
    
    #Who follows you
    has_many :followed_users, through: :inverse_followerships, source: :follower
    
    #Who you follow
    has_many :followers, through: :inverse_followerships, source: :followed

    validates :username, presence: true, uniqueness: true, length: {in: 1..15}
    validates :name, presence: true, length: {in: 1..15}


    #throws a list of users to followed_id
    def follow_suggest
     User.where.not(id: followers).where.not(id: id)
    end

    def follow_and_own_opinions
    Opinion.where(author_id: self).or(Opinion.where(author_id: followers))
    end
end
