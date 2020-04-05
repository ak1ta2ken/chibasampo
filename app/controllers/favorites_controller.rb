class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(stroll_id: params[:stroll_id])
    redirect_to strolls_url, notice: "#{favorite.stroll.user.name}さんの散歩をお気に入りしました"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to strolls_url, notice: "#{favorite.stroll.user.name}さんの散歩をお気に入り解除しました"
  end
end