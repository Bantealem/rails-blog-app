require 'rails_helper'

RSpec.describe Post, type: :model do
    subject(:post) { Post.create(title: 'Develoment', comments_counter: 1, likes_counter: 20) }

  it 'should have a title' do
    post.title = nil
    expect(post).to_not be_valid
  end

  it "should have valid length of title" do
    post.title = 'b' * 255
    expect(post).to_not be_valid
  end
  it "should have comments_counter greater than zero" do
    post.comments_counter = -2
    expect(post).to_not be_valid
  end

  it " comments_counter should have only integer " do
    post.comments_counter = 'd'
    expect(post).to_not be_valid
  end

  it "likes_counter should be greater than zero" do
    post.likes_counter = -3
    expect(post).to_not be_valid
  end

  it "likes_counter should only have integers" do
    post.likes_counter = 'cc'
    expect(post).to_not be_valid
  end

end

