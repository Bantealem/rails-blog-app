# rubocop:disable all
class User < ApplicationRecord
  has_many :likes
  has_many :comments
  has_many :posts

    def recent_post
        posts.order('created_at Desc').limit(3)
    end
end
