require 'rails_helper'
RSpec.describe 'Post index page', type: :feature do
  before(:example) do
    @user1 = User.create!(name: 'Elon Musk', photo: 'https://pbs.twimg.com/media/FdTUjpUWQAEzO0n.jpg:large',
                          bio: 'Tweeter Owner.', posts_counter: 56)
    @post = Post.create!(author: @user1, title: 'Web Development', text: 'Learn Web developmet at Microverse',
                         comments_counter: 1, likes_counter: 0)
    Comment.create!(author_id: @user1.id, post_id: @post.id, text: 'this is first comment')
    visit user_posts_path(user_id: @user1.id)
  end
  describe 'User index page' do
    it 'I can see the users profile picture.' do
      expect(page).to have_css("img[src='https://pbs.twimg.com/media/FdTUjpUWQAEzO0n.jpg:large']")
    end

    it 'I can see the user username.' do
      expect(page).to have_content(@user1.name)
    end

    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content(@user1.posts_counter)
    end
    it 'I can see a posts title.' do
      expect(page).to have_content(@post.title)
    end

    it 'I can see some of the post body.' do
      expect(page).to have_content(@post.text)
    end

    it 'I can see the first comments on a post.' do
      expect(page).to have_content('this is first comment')
    end

    it 'I can see how many comments a post has.' do
      expect(page).to have_content(@post.comments_counter)
    end

    it 'I can see how many likes a post has.' do
      expect(page).to have_content(@post.likes_counter)
    end

    it 'I can see a section for pagination if there are more posts than fit on the view.' do
      expect(page).to have_content(@post.author.name)
    end

    it 'redirects to the post show page when the post title is clicked' do
      click_link(@post.title)
      expect(page).to have_current_path(user_post_path(@user1, @post))
    end
  end
end
