require 'rails_helper'
RSpec.describe 'User show page', type: :feature do
  before(:example) do
    @user1 = User.create!(name: 'Elon Musk',
                          photo: 'https://pbs.twimg.com/media/FdTUjpUWQAEzO0n.jpg:large',
                          bio: 'Tweeter Owner.', posts_counter: 4)
    @post = Post.create!(author: @user1, title: 'Web Development', text: 'Learn Web developmet at Microverse',
                         comments_counter: 24, likes_counter: 23)

    Post.create!(author: @user1, title: 'Learn how to learn', text: 'Learn Web developmet from scratch',
                 comments_counter: 26, likes_counter: 24)
    Post.create!(author: @user1, title: 'React frame work', text: 'Learn React redux from scratch',
                 comments_counter: 28, likes_counter: 25)
    Post.create!(author: @user1, title: 'Ruby Rails', text: 'Learn Ruby on Rails', comments_counter: 29,
                 likes_counter: 26)
    Post.create!(author: @user1, title: 'Learn Programing', text: 'Learn Flutter from scratch',
                 comments_counter: 27, likes_counter: 22)

    visit user_path(id: @user1.id)
  end
  describe 'User show page' do
    it 'Should List all users photo' do
      expect(page).to have_css("img[src='https://pbs.twimg.com/media/FdTUjpUWQAEzO0n.jpg:large']")
    end

    it 'I can see the users username.' do
      expect(page).to have_content(@user1.name)
    end

    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content(@user1.posts_counter)
    end

    it 'I can see the user bio.' do
      expect((page)).to have_content(@user1.bio)
    end

    it 'I can see the users first 3 posts.' do
      expect(page).to have_content('Learn')
      expect(page).to have_content('React')
      expect(page).to have_content('Ruby')
    end

    it 'click a user post and redirects to post show page' do
      click_link 'See All Posts'
      expect(page).to have_current_path user_posts_path(@user1)
    end

    it 'displays button to see all posts' do
      expect(page).to have_link('See All Posts') if @user1.posts_counter > 0
    end

    it 'When I click to see all posts, it redirects me to the user posts index page.' do
      if @user1.posts_counter > 0
        click_link('See All Posts')
        expect(current_path).to eq "/users/#{@user1.id}/posts"
      else
        expect(page).to have_content('The list is empty for the posts by the user')
      end
    end
  end
end
