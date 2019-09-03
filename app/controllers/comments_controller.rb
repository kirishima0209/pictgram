class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(comment_params)
    @comment.topic_id = params[:topic_id]
    #binding.pry
    if @comment.save
       redirect_to topics_path, success: 'コメントの投稿に成功しました'
    else
      flash.now[:danger] = "コメントの投稿に失敗しました"
      render :new
    end 
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content, :topic_id)
  end  
end
