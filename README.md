<h1 align="center">フリーマーケットアプリケーション（FURIMA）</h1>

![top_page](https://i.gyazo.com/45613b90ee36532f8d3dfd76dcdd0859.jpg)

## :globe_with_meridians: FURIMAとは
* フリーマーケット用のWebアプリケーションです。
* スクラム（5人）によるアジャイル開発を行いました。
* Trelloによるタスク管理。
* 作成期間： 2020/8/4 〜 2020/8/26（22日間）
* 1日あたりの平均作業時間：10時間

### BASIC認証
本番環境URL：http://54.95.82.149
* user：admin
* password：password
### テスト用アカウント等
* 購入者用メールアドレス: test@test.com
* パスワード: 1234567
### 購入用カード情報
* 番号： 4242424242424242
* 期限： 1/23
* セキュリティコード：123
### 出品者用
* メールアドレス名: test100@test.com
* パスワード: 1234567

## :globe_with_meridians: 機能一覧
- ユーザー登録、ログイン機能（ウィザード形式）
- ユーザー登録、ログインがお済みでない方も商品の一覧、詳細を閲覧可能です。
- 商品出品機能（画像や商品カテゴリを含めた複数項目の情報をデータベースへ登録）
- 商品購入機能（ユーザーが所持するクレジットカードを用いて商品の購入）
- クレジットカード登録機能（PAY.JP）

## :globe_with_meridians: 主な使用技術・言語・ツールなど
<a><img src="https://user-images.githubusercontent.com/39142850/71774533-1ddf1780-2fb4-11ea-8560-753bed352838.png" width="70px;" /></a> <!-- rubyのロゴ -->
<a><img src="https://user-images.githubusercontent.com/39142850/71774548-731b2900-2fb4-11ea-99ba-565546c5acb4.png" height="60px;" /></a> <!-- RubyOnRailsのロゴ -->
<a><img src="https://user-images.githubusercontent.com/39142850/71774618-b32edb80-2fb5-11ea-9050-d5929a49e9a5.png" height="60px;" /></a> <!-- Hamlのロゴ -->
<a><<img src="https://user-images.githubusercontent.com/39142850/71774644-115bbe80-2fb6-11ea-822c-568eabde5228.png" height="60px" /></a> <!-- Scssのロゴ -->
<a><img src="https://user-images.githubusercontent.com/39142850/71774768-d064a980-2fb7-11ea-88ad-4562c59470ae.png" height="65px;" /></a> <!-- jQueryのロゴ -->
<a><img src="https://user-images.githubusercontent.com/39142850/71774786-37825e00-2fb8-11ea-8b90-bd652a58f1ad.png" height="60px;" /></a> <!-- AWSのロゴ -->
### ■ 言語

#### バックエンド
* Ruby 2.6.5

#### フロントエンド
* Haml 5.1.2
* Sass 3.7.4
* jquery-rails 4.4.0

### ■ フレームワーク
* Ruby on Rails 6.0.3.2

### ■ データベース
* MySQL 5.6.50

### ■ インフラ
* AWS EC2
* AWS S3

### ■ デプロイ
* Capistrano(3.14.1)による自動デプロイ

### ■ WEBサーバー
* nginx

### ■ アプリケーションサーバー
* unicorn 5.6.0

### ■ コードレビューツール
* Sider
* Rubocop 0.92.0

## :globe_with_meridians: インストール方法
1.このリポジトリを複製<br>
`$ git clone https://github.com/kuriken0410/fleamarket_sample_80a.git`

2.インストールしたリポジトリに移動<br>
`$ cd fleamarket_sample_80a`

3.gemをアプリケーションに適用<br>
`$ bundle install`<br>

4.データベースの作成&反映<br>
`$ rails db:create`<br>
`$ rails db:migrate`<br>

5.カテゴリ一覧の反映<br>
`$ rails db:seed`<br>

6.アプリケーションの起動<br>
`$ rails s`<br>
:point_right:`http://localhost:3000`

## :page_facing_up: データベース設計

## ER図
![Fleamarket_sample_80a](https://user-images.githubusercontent.com/63842526/91152535-09de5680-e6fa-11ea-95e3-b4273edfb7ac.jpg)

## usersテーブル
|Column|Type|Options|
|-----|--|------|
|nickname|string|null:false|
|email|string|null:false|
|password|string|null:false|
|password_confirm|string|null:false|
|first_name|string|null:false|
|last_name|string|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|birthday|date||
### Association
* has_many :products, dependent:delete_all
* has_one :address,dependent:delete

## addテーブル
|Column|Type|Options|
|-----|--|------|
|user_id|reference|null:false, foreign_key:true|
|postal_code|string|null:false|
|prefecture_id|integer|null:false,foreign_key:true|
|municipality|string|null:false|
|block_number|string|null:false|
|apartment_name|string||
### Association
* belongs_to :user

## cardsテーブル
|Column|Type|Options|
|-----|--|------|
|user_id|integer|null:false, foreign_key:true|
|customer_id|string|null:false|
|card_id|string|null:false|
### Associtation
* belongs_to :user

## productsテーブル
|Column|Type|Options|
|-----|--|------|
|name|string|null:false|
|price|integer|null:false|
|send_price|integer|null:false|
|description|text|null:false|
|condition|integer|null:false|
|brand|string||
|status|integer|null:false|
|ship_day|string|null:false|
|category_id|integer|null:false|
### Association
* has_many :images
* belongs_to :user
* belongs_to :category

## imagesテーブル
|Column|Type|Options|
|-----|--|------|
|image|string|null:false|
|product_id|reference|null:false, foreign_key:true|
### Associtation
* belongs_to :product

## categoriesテーブル
|Column|Type|Options|
|-----|--|------|
|name|string|null:false|
|ancestry|string|null: false|
### Association
* has_many :products
* has_ancestry

## contractsテーブル
|Column|Type|Options|
|-----|--|------|
|user_id|integer|null:false, foreign_key:true|
|product_id|integer|null: false, foreign_key:true|
### Association
* belongs_to :product
* belongs_to :user
<br>
<br>
:point_right:本アプリケーション詳細説明文URL<br>
https://docs.google.com/document/d/1W3TNL9I-7KhF-XqQWVl77KNbbDBDiExdvmIGWPZ_olU/edit
