require 'rails_helper'
RSpec.describe 'Post show page', type: :feature do
  before(:example) do
    @user1 = User.create!(name: 'Elon Musk',
                          photo: 'https://pbs.twimg.com/media/FdTUjpUWQAEzO0n.jpg:large',
                          bio: 'Tweeter.', posts_counter: 56)
    @post = Post.create!(author: @user1, title: 'Web Development', text: 'Learn Web developmet at Microverse',
                         comments_counter: 1, likes_counter: 0)
    Comment.create(author_id: @user1.id, post_id: @post.id, text: 'gkfdsctviubkfewsduyftkgjbrefdsc')
    visit user_posts_path(user_id: @user1.id, id: @post.id)
  end
  describe 'User index page' do
    it 'I can see the user username.' do
      expect(page).to have_content(@user1.name)
    end

    it 'I can see a posts title.' do
      expect(page).to have_content(@post.title)
    end

    it 'I can see some of the post body.' do
      expect(page).to have_content(@post.text)
    end

    it 'I can see how many comments a post has.' do
      expect(page).to have_content(@post.comments_counter)
    end

    it 'I can see the username of each commentor.' do
      expect(page).to have_content(@user1.name)
    end

    it 'I can see how many likes a post has.' do
      expect(page).to have_content(@post.likes_counter)
    end

    it 'I can see the comment each commentor left.' do
      expect(page).to have_content('gkfdsctviubkfewsduyftkgjbrefdsc')
    end
  end
end
