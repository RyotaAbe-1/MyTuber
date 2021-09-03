class Public::CommentsController < ApplicationController
  def create
    @youtuber = Youtuber.find(params[:youtuber_id])
    @comment = Comment.new(comment_params)
    @comment.youtuber_id = @youtuber.id
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to youtuber_path(@youtuber)
    else
      @youtuber_comments = @youtuber.comments.includes(:user)
      @user_profile = User.find(@youtuber.user.id)
      @genres = Genre.where(application_status: true)
      render "public/youtubers/show"
    end
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
