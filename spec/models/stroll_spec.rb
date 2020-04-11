require 'rails_helper'

RSpec.describe Stroll, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end
  it "タイトルが空ならバリデーションが通らない" do
    stroll = Stroll.new(title: '', content: 'failure', user_id: @user.id)
    expect(stroll).not_to be_valid
  end
  it "タイトルが29文字以上ならバリデーションが通らない" do
    stroll = Stroll.new(title: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa', content: 'failure', user_id: @user.id)
    expect(stroll).not_to be_valid
  end
  it "記事が空ならバリデーションが通らない" do
    stroll = Stroll.new(title: 'failure', content: '', user_id: @user.id)
    expect(stroll).not_to be_valid
  end
  it "記事が141文字以上ならバリデーションが通らない" do
    stroll = Stroll.new(title: 'failure', content: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', user_id: @user.id)
    expect(stroll).not_to be_valid
  end
  it "タイトルと記事が入力されてたらバリデーションが通る" do
    stroll = Stroll.new(title: 'success', content: 'success', user_id: @user.id)
    expect(stroll).to be_valid
  end
end
