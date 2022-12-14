# rubocop:disable all
class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @comment = Comment.new
    @like = Like.new
  end

  def create_comment
    @comment = Comment.new(comment_params)
    @comment.post = Post.find(params[:id])
    @comment.author = current_user
    redirect_to post_path if @comment.save
  end

  def create_like
    @like = Like.new(author: current_user, post: Post.find(params[:id]))
    redirect_to post_path if @like.save
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @post.likes_counter = 0
    @post.comments_counter = 0
    return unless @post.save

    redirect_to posts_new_path
    flash[:success] = 'Post have been saved successfully'
  end

  def new
    @post = Post.new
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
