class CommentsController < ApplicationController

  def create
    post = Post.where(id: params[ :post_id]).first
    @comment = post.comments.create(comments_params)
    
    redirect_to post_path(id: post.id)
  end
  
  def destroy
    @post = Post.where(id: params[:post_id]).first
    @comment = @post.comments.where(id: params[:id]).first
    @comment.destroy

    redirect_to post_path(@post)
  end
  
  
  private
    
    def comments_params
      params.require(:comment).permit(:name,:body)
    end
end