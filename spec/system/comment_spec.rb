# require 'rails_helper'
#
# RSpec.describe Comment, type: :system do
#   before do
#     user = FactoryBot.create(:user)
#     second_user = FactoryBot.create(:second_user)
#     stroll = FactoryBot.create(:stroll, user: user)
#     visit root_path
#     click_link 'Login'
#     fill_in('user_email', with: 'second_user@com')
#     fill_in('user_password', with: 'password')
#     click_on "ログイン"
#     click_link "Strolls"
#     click_link '記事を読む', match: :first
#   end
#
#   describe '投稿詳細画面', js: true do
#     context 'ログインしているユーザーが記事の投稿者以外の場合' do
#       it "投稿にコメントができること" do
#         fill_in('comment_content', with: 'chiba')
#         click_on 'コメントする'
#         expect(page).to have_content 'chiba'
#       end
#       it '自分のコメントが編集できること' do
#         fill_in('comment_content', with: 'chiba')
#         click_on 'コメントする'
#         click_link '編集'
#         fill_in('edit_comment', with: 'funa')
#         click_on '編集する'
#         expect(page).to have_content 'funa'
#       end
#       it '自分のコメントが削除できること' do
#         fill_in('comment_content', with: 'chiba')
#         click_on 'コメントする'
#         click_link '削除'
#         expect(page).to have_no_content 'chiba'
#       end
#     end
#     context 'ログインしているユーザーが記事の投稿者の場合' do
#       it '投稿にコメントができないこと' do
#         click_link 'Logout'
#         click_link 'Login'
#         fill_in('user_email', with: 'user@com')
#         fill_in('user_password', with: 'password')
#         click_on "ログイン"
#         click_link "Strolls"
#         click_link '記事を読む', match: :first
#         expect(page).to have_no_button 'コメントする'
#       end
#     end
#     context 'ユーザーがログアウトした場合' do
#       it '投稿にコメントができないこと' do
#         click_link 'Logout'
#         click_link "Strolls"
#         click_link '記事を読む', match: :first
#         expect(page).to have_no_button 'コメントする'
#       end
#     end
#   end
# end
