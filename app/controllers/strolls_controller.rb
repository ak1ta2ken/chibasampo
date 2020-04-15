class StrollsController < ApplicationController
  before_action :set_stroll, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @strolls = Stroll.all.order(created_at: :desc)
    @q = Stroll.ransack(params[:q])
    if params[:q]{:title_or_content_users_cont_any}.present?
      @strolls = @q.result(distinct: true).order(created_at: :desc)
    elsif params[:q]{:tag_eq}.present?
      @strolls = @q.result(distinct: true).order(created_at: :desc)
    end
  end
  def new
    @stroll = Stroll.new
  end
  def create
    @stroll = Stroll.create(stroll_params)
    @stroll.user_id = current_user.id
    if @stroll.save
      redirect_to strolls_path, notice: "新しく投稿しました！"
    else
      render :new
    end
  end
  def show
    @comments = @stroll.comments
    @comment = @stroll.comments.build
    @favorite = current_user.favorites.find_by(stroll_id: @stroll.id) if current_user
    @user = @stroll.user
  end
  def edit
    if current_user.id != @stroll.user.id
      redirect_to strolls_path, notice: "権限がありません。"
    end
  end
  def update
    if @stroll.update(stroll_params)
      redirect_to stroll_path(@stroll.id), notice: "記事を編集しました！"
    else
      render :edit
    end
  end
  def destroy
    if current_user.id != @stroll.user.id
      redirect_to strolls_path, notice: "権限がありません。"
    else
      @stroll.destroy
      redirect_to strolls_path, notice:"記事を削除しました！"
    end
  end

  private

  def stroll_params
    params.require(:stroll).permit(:image, :image_cache, :title, :content, :tag)
  end
  def set_stroll
    @stroll = Stroll.find(params[:id])
  end
end
