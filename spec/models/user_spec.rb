require 'rails_helper'

RSpec.describe User, type: :model do
  it 'お名前が空ならバリデーションが通らない' do
    user = User.new(name: '', email: 'failure@com', password: 'failure', password_confirmation: 'failure')
    expect(user).not_to be_valid
  end
  it 'お名前が他のユーザーと重複するならバリデーションが通らない' do
    name = "error"
    user = User.create(name: name, email: 'user@com', password: 'failure', password_confirmation: 'failure')
    second_user = User.create(name: name, email: 'second_user@com', password: 'failure', password_confirmation: 'failure')
    expect(user).to be_valid
    expect(second_user).not_to be_valid
  end
  it 'メールアドレスが空ならバリデーションが通らない' do
    user = User.new(name: 'failure', email: '', password: 'failure', password_confirmation: 'failure')
    expect(user).not_to be_valid
  end
  it 'メールアドレスが他のユーザーと重複するならバリデーションが通らない' do
    email = "error@com"
    user = User.create(name: 'user', email: email, password: 'failure', password_confirmation: 'failure')
    second_user = User.create(name: 'second_user', email: email, password: 'failure', password_confirmation: 'failure')
    expect(user).to be_valid
    expect(second_user).not_to be_valid
  end
  it 'パスワードが空ならバリデーションが通らない' do
    user = User.new(name: 'failure', email: 'failure@com', password: '', password_confirmation: 'failure')
    expect(user).not_to be_valid
  end
  it 'パスワードが6文字未満ならバリデーションが通らない' do
    password = "error"
    user = User.new(name: 'failure', email: 'failure@com', password: password, password_confirmation: password)
    expect(user).not_to be_valid
  end
  it '確認用パスワードが空ならバリデーションが通らない' do
    user = User.new(name: 'failure', email: 'failure@com', password: 'failure', password_confirmation: '')
    expect(user).not_to be_valid
  end
  it 'パスワードと確認用パスワードが一致しないとバリデーションが通らない' do
    user = User.new(name: 'failure', email: 'failure@com', password: 'failure', password_confirmation: 'error')
    expect(user).not_to be_valid
  end
  it 'お名前とメールアドレスが入力されてパスワードが6文字以上で確認用パスワードと一致したらバリデーションが通る' do
    user = User.new(name: 'success', email: 'success@com', password: 'success', password_confirmation: 'success')
    expect(user).to be_valid
  end
end
