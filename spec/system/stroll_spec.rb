require 'rails_helper'

RSpec.describe Stroll, type: :system do
  before do
    user = FactoryBot.create(:user)
    second_user = FactoryBot.create(:second_user)
    stroll = FactoryBot.create(:stroll, user: user)
    second_stroll = FactoryBot.create(:second_stroll, user: user)
    third_stroll = FactoryBot.create(:third_stroll, user: user)
  end

  describe '投稿一覧画面' do
    context 'Strollsリンクを押した場合' do
      before do
        visit root_path
        click_link 'Strolls'
      end
      it '作成済みの投稿が表示されること' do
        expect(page).to have_content 'chiba'
        expect(page).to have_content 'funa'
        expect(page).to have_content 'niho'
      end
    end
    context '複数の投稿をした場合' do
      before do
        visit root_path
        click_link 'Strolls'
      end
      it '投稿した降順に並んでいること' do
        stroll_list = all('.stroll_row')
        expect(stroll_list[0]).to have_content 'niho'
        expect(stroll_list[1]).to have_content 'funa'
        expect(stroll_list[2]).to have_content 'chiba'
      end
    end
    context 'キーワードとタグで絞り込み検索した場合' do
      before do
        visit root_path
        click_link 'Strolls'
      end
      it 'キーワードにのみ値が入っていた場合はキーワードのみで検索' do
        fill_in('q_title_or_content_or_user_name_or_user_profile_cont_any', with: 'chiba')
        click_on '検索'
        expect(page).to have_no_content 'funa'
        expect(page).to have_no_content 'niho'
        expect(page).to have_content 'chiba'
      end
      it 'タグにのみ値が入っていた場合はタグのみで検索' do
        select 'グルメ', from: 'q_tag_eq'
        click_on '検索'
        expect(page).to have_no_content 'chiba'
        expect(page).to have_content 'funa'
        expect(page).to have_content 'niho'
      end
      it '全て値が入っていた場合は全て成り立つものを検索' do
        fill_in('q_title_or_content_or_user_name_or_user_profile_cont_any', with: 'niho')
        select 'グルメ', from: 'q_tag_eq'
        click_on '検索'
        expect(page).to have_no_content 'chiba'
        expect(page).to have_no_content 'funa'
        expect(page).to have_content 'niho'
      end
    end
    context "ログインしていないユーザーが新しく投稿するボタンを押した場合" do
      before do
        visit root_path
        click_link 'Strolls'
      end
      it "ログイン画面に遷移すること" do
        click_on '新しく投稿する'
        expect(page).to have_content 'アカウント登録もしくはログインしてください。'
      end
    end
  end

  describe '新規投稿画面' do
    context '必要項目を入力して、投稿するボタンを押した場合' do
      before do
        visit root_path
        click_link 'Login'
        fill_in('user_email', with: 'user@com')
        fill_in('user_password', with: 'password')
        click_on 'ログイン'
        click_link 'Strolls'
      end
      it "データが保存されること" do
        click_link '新しく投稿する'
        fill_in('タイトル', with: 'マックス')
        fill_in('記事', with: 'コーヒー')
        click_on '投稿する'
        expect(page).to have_content '新しく投稿しました！'
      end
    end
  end

  describe '投稿詳細画面' do
    context "ユーザーが投稿一覧画面で記事を読むボタンを押した場合" do
      before do
        visit root_path
        click_link 'Strolls'
      end
      it '該当の内容が表示されたページに遷移すること' do
        click_link '記事を読む', match: :first
        expect(page).to have_content 'nihosampo'
      end
    end
    context "ログインしているユーザーが記事の投稿者以外の場合" do
      before do
        visit root_path
        click_link 'Login'
        fill_in('user_email', with: 'second_user@com')
        fill_in('user_password', with: 'password')
        click_on 'ログイン'
        click_link 'Strolls'
      end
      it '投稿をお気に入り登録ができること' do
        click_link '記事を読む', match: :first
        click_link 'お気に入りに登録'
        expect(page).to have_content 'お気に入りに登録しました'
      end
      it '1つの投稿に1回しかお気に入り登録ができないこと' do
        click_link '記事を読む', match: :first
        click_link 'お気に入りに登録'
        expect(page).to have_content 'お気に入りに登録しました'
        click_link '記事を読む', match: :first
        expect(page).to have_content 'お気に入りから解除'
      end
    end
    context "ログインしているユーザーが記事の投稿者の場合" do
      before do
        visit root_path
        click_link 'Login'
        fill_in('user_email', with: 'user@com')
        fill_in('user_password', with: 'password')
        click_on 'ログイン'
        click_link 'Strolls'
      end
      it '投稿した記事の編集ができること' do
        click_link '記事を読む', match: :first
        click_link ('編集')
        fill_in('stroll_title', with: 'change')
        click_on '編集する'
        expect(page).to have_content '投稿を編集しました！'
        expect(page).to have_content 'change'
      end
      it '投稿した記事の削除ができること' do
        click_link '記事を読む', match: :first
        click_link ('削除')
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '投稿を削除しました！'
        expect(page).to have_no_content 'niho'
      end
      it "自分の投稿をお気に入り登録ができないこと" do
        click_link '記事を読む', match: :first
        expect(page).to have_no_content 'お気に入りに登録'
      end
    end
  end
end
