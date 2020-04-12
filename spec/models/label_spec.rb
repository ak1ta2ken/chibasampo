require 'rails_helper'

RSpec.describe Label, type: :model do
  it "label_nameが空でもバリデーションが通る" do
    label = Label.new(label_name: '')
    expect(label).to be_valid
  end
end
