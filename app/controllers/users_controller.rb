class UsersController < ApplicationController
  def show
    @user = current_user
    @strolls = @user.strolls.order(created_at: :desc).page(params[:page])
  end
  def favorites
    @user = current_user
    @favorites = Favorite.where(user_id: @user.id).all.order(created_at: :desc).page(params[:page])
  end
  def new_guest
    user = User.find_or_create_by!(name: 'guest', email: 'guest@com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to users_show_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
