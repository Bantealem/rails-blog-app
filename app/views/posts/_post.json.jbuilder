# rubocop:disable all
json.extract! post, :id, :title, :text, :comments_counter, :likes_counter, :integer, :created_at, :updated_at
json.url post_url(post, format: :json)
