require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @stroll = FactoryBot.create(:stroll, user_id: @user.id)
  end
  it "コメントが空ならバリデーションが通らない" do
    comment = Comment.new(content: "", user_id: @user.id, stroll_id: @stroll.id)
    expect(comment).not_to be_valid
  end
  it "user_idが空ならバリデーションが通らない" do
    comment = Comment.new(content: "chiba", user_id: "", stroll_id: @stroll.id)
    expect(comment).not_to be_valid
  end
  it "stroll_idが空ならバリデーションが通らない" do
    comment = Comment.new(content: "chiba", user_id: @user.id, stroll_id: "")
    expect(comment).not_to be_valid
  end
  it "コメントとuser_idとstroll_idが入力されてたらバリデーションが通る" do
    comment = Comment.new(content: "chiba", user_id: @user.id, stroll_id: @stroll.id)
    expect(comment).to be_valid
  end
end
