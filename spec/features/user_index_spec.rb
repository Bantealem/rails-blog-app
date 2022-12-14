require 'rails_helper'
RSpec.describe 'User index page', type: :feature do
  before(:example) do
    @user1 = User.create!(name: 'Elon Musk',
                          photo: 'https://pbs.twimg.com/media/FdTUjpUWQAEzO0n.jpg:large',
                          bio: 'Tweeter Owner.', posts_counter: 56)
    visit '/'
  end
  describe 'User index page' do
    it 'Should List all users name' do
      expect(page).to have_content(@user1.name)
    end
    it 'Should List all users photo' do
      expect(page).to have_css("img[src='https://pbs.twimg.com/media/FdTUjpUWQAEzO0n.jpg:large']")
    end
    it 'Should List all users number of posts' do
      expect(page).to have_content(@user1.posts_counter)
    end
    it 'When I click to the user name i am redirected to users show page' do
      click_link(@user1.name)
      expect(current_path).to match user_path(@user1)
    end
  end
end
