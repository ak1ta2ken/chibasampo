# ChibaSampo

## 概要
- 千葉の画像を投稿するアプリ
- お気に入り機能とコメントを投稿できます

## コンセプト
- 千葉を散歩するアプリ

## 背景
- 千葉は令和元年台風15号及び台風19号並びに10月25日の大雨で大きな被害を受けました
- 県民として微力ながら千葉を応援したいのでそのためには千葉を知ることから始めよう
- 千葉を散歩するようなアプリを作ることでいろんな人が千葉を知るきっかけになれたら

## バージョン情報
- Ruby 2.6.5
- Ruby on Rails 5.2.4.2
- PostgreSQL 12.1
- Bootstrap 3.4.1

## 機能一覧
- [ ] ログイン機能
- [ ] ユーザー登録機能
  - [ ] メールアドレス、名前、パスワードは必須
- [ ] 一覧表示機能
- [ ] 投稿機能
  - [ ] 画像投稿機能
    - [ ] タイトルと記事は必須
  - [ ] タグ機能
    - [ ] 投稿にタグを付けられる
- [ ] 編集及び削除機能
  - [ ] 投稿者のみ可能
- [ ] お気に入り機能
  - [ ] 1つの投稿に1人1回しかできない
  - [ ] 自分自身の投稿はお気に入りできない
- [ ] コメント機能
  - [ ] 編集と削除はコメントした本人のみ可能
- [ ] 検索機能
  - [ ] キーワードで検索できる
  - [ ] タグで検索できる

## カタログ設計
https://docs.google.com/spreadsheets/d/e/2PACX-1vRy1VuJP4AgnnjAjs_oOAT-tOUXp-7QraHagHDJaKBO7BSvacPeQWuZeYUcmPNSb2Rr0n9uQ3fO1rB0/pubhtml

## テーブル定義
https://docs.google.com/spreadsheets/d/e/2PACX-1vRvO0tt7TK-YVUGYbpSjyikHuiGPLNtlmXMdOWlKMt-Tk5H5MSAWIlz_JZJ0HOY-IskZaC6Q9-Sby_I/pubhtml

## ER図
https://docs.google.com/spreadsheets/d/e/2PACX-1vTN0SOrAOZx4KhGnLvMuPPYoo3JYF1Rdx8POwV1zZ8FGZdDGlktawyDeMbtYwGUmM13teRihVAYN4h6/pubhtml

## 画面遷移図
https://docs.google.com/spreadsheets/d/e/2PACX-1vRZtE8SQ0aiokUqw48znx4eMBdXwkEJM7fKRnnIIS4Y3h3dOOML7UWHJf7V1Q6aIVJiWGd1Wmf-DK7c/pubhtml

## ワイヤーフレーム
https://docs.google.com/spreadsheets/d/e/2PACX-1vTWv-tCjIKoIRKmpVJbwX9s8qSvrdFvq3Vig6aQ19d2klQkBezRknswrXKqsnghII4CejIGNqxaZR5q/pubhtml

## 使用予定Gem
- devise
- devise-i18n
- carrierwave
- minimagick
- faker
- ransack
- font-awesome-rails
- kaminari
- kaminari-bootstrap
- fog-aws

## Heroku
https://serene-inlet-27158.herokuapp.com/
