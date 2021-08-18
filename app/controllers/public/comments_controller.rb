class Public::CommentsController < ApplicationController
  def create
    youtuber = Youtuber.find(params[:youtuber_id])
    comment = Comment.new(comment_params)
    comment.youtuber_id = youtuber.id
    comment.user_id = current_user.id
    comment.save
    redirect_to youtuber_path(youtuber)
  end

  def destroy
    youtuber = Youtuber.find(params[:youtuber_id])
    comment = Comment.find_by(id: params[:id], youtuber_id: youtuber.id)
    comment.destroy
    redirect_to youtuber_path(youtuber)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
