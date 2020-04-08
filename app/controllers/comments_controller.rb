class CommentsController < ApplicationController
  def create
    @stroll = Stroll.find(params[:stroll_id])
    @comment = @stroll.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.js { render :errors }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :stroll_id, :content)
  end
end
