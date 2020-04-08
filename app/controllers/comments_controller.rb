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
  def destroy
    @stroll = Stroll.find(params[:stroll_id])
    @comment = @stroll.comments.find(params[:id])
    respond_to do |format|
      if current_user.id == @comment.user_id
        @comment.destroy
        format.js { render :index }
      else
        format.html { redirect_to stroll_path(@stroll), notice: '権限がありません。' }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :stroll_id, :content)
  end
end
