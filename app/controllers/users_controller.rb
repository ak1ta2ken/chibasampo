class UsersController < ApplicationController
  def show
    @user = current_user
  end
  def favorites
    @user = current_user
    @favorites = Favorite.where(user_id: @user.id).all
  end
end
