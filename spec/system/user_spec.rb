require 'rails_helper'

RSpec.describe User, type: :system do
  before do
    user = FactoryBot.create(:user)
  end
  describe 'アカウント登録画面' do
    context '必須項目を入力して、アカウント登録ボタンを押した場合' do
      it 'アカウントが登録されること' do
        visit root_path
        click_link 'Signup'
        fill_in('user_name', with: 'name')
        fill_in('user_email', with: 'email@com')
        fill_in('user_password', with: 'password')
        fill_in('user_password_confirmation', with: 'password')
        click_on 'アカウント登録'
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
    end
  end

  describe 'ログイン画面' do
    context '必須項目を入力して、ログインボタンを押した場合' do
      it 'ログインできること'do
        visit root_path
        click_link 'Login'
        fill_in('user_email', with: 'user@com')
        fill_in('user_password', with: 'password')
        click_on 'ログイン'
        expect(page).to have_content 'ログインしました。'
      end
      it 'プロフィールが編集できること' do
        visit root_path
        click_link 'Login'
        fill_in('user_email', with: 'user@com')
        fill_in('user_password', with: 'password')
        click_on 'ログイン'
        click_link 'プロフィールを編集する'
        fill_in('user_name', with: 'change_user')
        fill_in('user_email', with: 'change@com')
        fill_in('user_profile', with: 'change')
        click_on '更新'
        expect(page).to have_content 'change_user'
        expect(page).to have_content 'change@com'
      end
      it 'アカウントが削除されること' do
        visit root_path
        click_link 'Login'
        fill_in('user_email', with: 'user@com')
        fill_in('user_password', with: 'password')
        click_on 'ログイン'
        click_link 'プロフィールを編集する'
        click_on 'アカウント削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'アカウントを削除しました。またのご利用をお待ちしております。'
      end
      it 'ログアウトできること' do
        visit root_path
        click_link 'Login'
        fill_in('user_email', with: 'user@com')
        fill_in('user_password', with: 'password')
        click_on 'ログイン'
        click_link 'Logout'
        expect(page).to have_content 'ログアウトしました。'
      end
    end
  end
end
