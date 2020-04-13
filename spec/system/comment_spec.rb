require 'rails_helper'

RSpec.describe Comment, type: :system do
  describe '投稿詳細画面', js: true do
    context 'ログインしているユーザーが記事の投稿者以外の場合' do
      before do
        user = FactoryBot.create(:user)
        second_user = FactoryBot.create(:second_user)
        stroll = FactoryBot.create(:stroll, user: user)
        visit root_path
        click_link 'Login'
        fill_in('user_email', with: 'second_user@com')
        fill_in('user_password', with: 'password')
        click_on "ログイン"
        click_link "Strolls"
        click_link '記事を読む', match: :first
        fill_in('comment_area', with: 'one')
        click_on 'コメントする'
      end
      it "投稿にコメントができること" do
        expect(page).to have_content 'one'
      end
    end
    context 'ログインしているユーザーが記事の投稿者以外の場合' do
      before do
        user = FactoryBot.create(:user)
        second_user = FactoryBot.create(:second_user)
        stroll = FactoryBot.create(:stroll, user: user)
        visit root_path
        click_link 'Login'
        fill_in('user_email', with: 'second_user@com')
        fill_in('user_password', with: 'password')
        click_on "ログイン"
        click_link "Strolls"
        click_link '記事を読む', match: :first
        fill_in('comment_area', with: 'one')
        click_on 'コメントする'
        click_link '編集'
        fill_in('comment_edit', with: 'two')
        click_on '編集する'
      end
      it '自分のコメントが編集できること' do
        expect(page).to have_content 'two'
      end
    end
    context 'ログインしているユーザーが記事の投稿者以外の場合' do
      before do
        user = FactoryBot.create(:user)
        second_user = FactoryBot.create(:second_user)
        stroll = FactoryBot.create(:stroll, user: user)
        visit root_path
        click_link 'Login'
        fill_in('user_email', with: 'second_user@com')
        fill_in('user_password', with: 'password')
        click_on "ログイン"
        click_link "Strolls"
        click_link '記事を読む', match: :first
        fill_in('comment_area', with: 'one')
        click_on 'コメントする'
        click_link '削除'
        page.driver.browser.switch_to.alert.accept
      end
      it '自分のコメントが削除できること' do
        expect(page).to have_no_content 'one'
      end
    end
  end
end
