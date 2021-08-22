class Admin::CommentsController < ApplicationController
  def destroy
    youtuber = Youtuber.find(params[:youtuber_id])
    comment = Comment.find_by(id: params[:id], youtuber_id: youtuber.id)
    comment.destroy
    redirect_to admin_youtuber_path(youtuber)
  end
end
