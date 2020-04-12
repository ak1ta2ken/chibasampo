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
        click_on '更新'
        expect(page).to have_content 'change_user'
        expect(page).to have_content 'change@com'
      end
      it 'プロフィールにラベルが貼れること' do
        @label = FactoryBot.create(:label)
        @label_id = @label.id
        visit root_path
        click_link 'Login'
        fill_in('user_email', with: 'user@com')
        fill_in('user_password', with: 'password')
        click_on 'ログイン'
        click_link 'プロフィールを編集する'
        check "user_label_ids_#{@label_id}"
        click_on '更新'
        expect(page).to have_content 'chiba'
      end
      it 'プロフィールに複数のラベルが貼れること' do
        @label = FactoryBot.create(:label)
        @label_id = @label.id
        @second_label = FactoryBot.create(:second_label)
        @second_label_id = @second_label.id
        visit root_path
        click_link 'Login'
        fill_in('user_email', with: 'user@com')
        fill_in('user_password', with: 'password')
        click_on 'ログイン'
        click_link 'プロフィールを編集する'
        check "user_label_ids_#{@label_id}"
        check "user_label_ids_#{@second_label_id}"
        click_on '更新'
        expect(page).to have_content 'chiba'
        expect(page).to have_content 'funa'
      end
      it 'プロフィールのラベルがはがせること' do
        @label= FactoryBot.create(:label)
        @label_id = @label.id
        visit root_path
        click_link 'Login'
        fill_in('user_email', with: 'user@com')
        fill_in('user_password', with: 'password')
        click_on 'ログイン'
        click_link 'プロフィールを編集する'
        check "user_label_ids_#{@label_id}"
        click_on '更新'
        click_link 'プロフィールを編集する'
        uncheck "user_label_ids_#{@label_id}"
        click_on '更新'
        expect(page).to have_no_content 'chiba'
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
