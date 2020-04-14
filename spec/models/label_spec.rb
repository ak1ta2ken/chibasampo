require 'rails_helper'

RSpec.describe Label, type: :model do
  it "label_nameが空ならバリデーションが通らない" do
    label = Label.create(label_name: '')
    expect(label).not_to be_valid
  end
  it "label_nameが入力されてたらバリデーションが通る" do
    label = Label.create(label_name: 'chiba')
    expect(label).to be_valid
  end
end
