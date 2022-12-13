# rubocop:disable all
class User < ApplicationRecord
  has_many :likes
  has_many :comments
  has_many :posts

  
    validates :name, presence: true
    validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

    def recent_post
        posts.order('created_at Desc').limit(3)
    end

end