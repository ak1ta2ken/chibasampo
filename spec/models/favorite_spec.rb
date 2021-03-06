require 'rails_helper'

RSpec.describe Favorite, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @second_user = FactoryBot.create(:second_user)
    @stroll = FactoryBot.create(:stroll, user_id: @user.id)
    @second_stroll = FactoryBot.create(:second_stroll, user_id: @user.id)
  end
  it "複数の投稿をお気に入り登録ができること" do
    favorite = Favorite.create(user_id: @second_user.id, stroll_id: @stroll.id)
    second_favorite = Favorite.create(user_id: @second_user.id, stroll_id: @second_stroll.id)
    expect(favorite).to be_valid
    expect(second_favorite).to be_valid
  end
  it "user_idが空ならバリデーションが通らない" do
    favorite = Favorite.create(user_id: "", stroll_id: @stroll.id)
    expect(favorite).not_to be_valid
  end
  it "stroll_idが空ならバリデーションが通らない" do
    favorite = Favorite.create(user_id: @user.id, stroll_id: "")
    expect(favorite).not_to be_valid
  end
  it "user_idとstroll_idが入力されてたらバリデーションが通る" do
    favorite = Favorite.create(user_id: @second_user.id, stroll_id: @stroll.id)
    expect(favorite).to be_valid
  end
end
