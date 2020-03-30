# chibasampo

## 概要
- 千葉の動画と画像を投稿することに特化したアプリ
- お気に入り機能とコメントを投稿することができます

## コンセプト
- 千葉を散歩するアプリ

## バージョン
- Ruby 2.6.5
- Ruby on Rails 5.2.4.2
- PostgreSQL 12.1

## 機能一覧
- [ ] ログイン機能
- [ ] ユーザー登録機能
  - [ ] メールアドレス、名前、パスワードは必須
- [ ] 一覧表示機能
- [ ] 投稿機能
  - [ ] 画像投稿機能
    - [ ] タイトルと記事は必須
  - [ ] 動画投稿機能
    - [ ] タイトルと記事は必須
  - [ ] ラベル機能
    - [ ] 投稿にラベルを付けられる
- [ ] 編集及び削除機能
  - [ ] 投稿者のみ可能
- [ ] お気に入り機能
  - [ ] 1つの投稿に1人1回しかできない
  - [ ] 自分自身の投稿はお気に入りできない
- [ ] コメント機能
  - [ ] 編集と削除はコメントした本人のみ可能

## カタログ設計
https://docs.google.com/spreadsheets/d/1Df4gSpSIaEFDmXrI4F7otvj-rqazm9uOGQzy4-CXAMk/edit#gid=0

## テーブル定義
https://docs.google.com/spreadsheets/d/1nz9gxGKoAtk0wSerywFglZlWo8fkQn_TDJFOJ88dOcQ/edit#gid=1928497795

## ER図
https://docs.google.com/spreadsheets/d/1QfhkA_4iviaoU6EXdT1qwMomEVFYralSEZ4nHtlP1P8/edit#gid=471519163

## 画面遷移図
https://docs.google.com/spreadsheets/d/1I0OqUoHOtE347BnKDzB3To1rI60N_sGMarBYTYWB-JI/edit#gid=842425362

## ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1RTX7PIooX_aNng91d0IQyjZSSyntGcTke_iaE1l0Acw/edit#gid=52021014

## 使用予定Gem
- devise
- carrierwave
- minimagick
- ffmpeg
- fog-aws
- bootstrap
