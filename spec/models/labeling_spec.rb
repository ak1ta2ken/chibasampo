require 'rails_helper'

RSpec.describe Labeling, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @label = FactoryBot.create(:label)
  end
  it "user_idが空ならバリデーションが通らない" do
    labeling = Labeling.new(user_id: "", label_id: @label.id)
    expect(labeling).not_to be_valid
  end
  it "label_idが空ならバリデーションが通らない" do
    labeling = Labeling.new(user_id: @user.id, label_id: "")
    expect(labeling).not_to be_valid
  end
  it "user_idとlabel_idが入力されてたらバリデーションが通る" do
    labeling = Labeling.new(user_id: @user.id, label_id: @label.id)
    expect(labeling).to be_valid
  end
end
