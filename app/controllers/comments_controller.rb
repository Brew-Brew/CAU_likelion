class CommentsController < ApplicationController
  
  #before_action :authenticate_user!
  #before_action :authenticate_user!, only: [:destroy]
  
  def create
    if user_signed_in?
      @post = Post.find(params[:post_id])
      @comment = @post.comments.create!(params.require(:comment).permit!) 
      @comment.commenter = current_user.name
      @comment.save
      redirect_to post_path(@post.team_id,@post)
    end
  end
  
  def destroy
    if user_signed_in?
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      @comment.destroy
      redirect_to post_path(@post.team_id,@post)
    end
  end
end
