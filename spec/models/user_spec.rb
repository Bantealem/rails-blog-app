require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create!(name: 'Bantealem', photo: 'myphoto', bio: 'developer', posts_counter: 23)
  end
  describe 'Creation' do
    it 'should have one item created after bing created' do
      expect(User.all.count).to eq(1)
    end
  end
  it 'post counter should only have ineteger' do
    @user.posts_counter = 'cc'
    expect(@user).to_not be_valid
  end
end
