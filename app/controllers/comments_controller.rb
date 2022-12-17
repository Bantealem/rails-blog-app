class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    post = Post.find(params[:post_id])
    comment = Comment.create(author: current_user, post: comment_params)
    return unless comment.save

    redirect_to user_post_path(current_user.id, post.id), notice: 'Comment saved'
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
