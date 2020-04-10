class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(stroll_id: params[:stroll_id])
    redirect_to strolls_url, notice: "#{favorite.stroll.user.name}さんの記事をいいね！しました。"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to strolls_url, notice: "#{favorite.stroll.user.name}さんの記事をいいね！から取り消しました。"
  end
end
