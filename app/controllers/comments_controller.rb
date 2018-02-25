class CommentsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :authenticate_user!, only: [:destroy]
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(params.require(:comment).permit!) 
    redirect_to post_path(@post.team_id,@post)
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post.team_id,@post)
  end
end
