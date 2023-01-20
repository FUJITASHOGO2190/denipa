# アプリケーション名
- Denipa

# アプリケーション概要
- 履き込んだデニムの写真を投稿し、デニム好き同士で共有することが出来る。
- デニムを購入する際の参考にできる。


# 利用方法
- トップページのヘッダーからユーザー新規登録を行う。
- 投稿ボタンから内容（着用年数、洗濯頻度、ブランド、コメント、画像）を入力し投稿する。
- 一覧ページで投稿された写真を閲覧、詳細ページにて気に入った投稿にコメント、お気に入りに登録出来る。

# アプリケーションを作成した背景
- 前職でデニムが主力なお店で販売員として働いていた時によくお客様に「このブランドのデニムはどんな風に色落ちするの？」「洗濯方法は？」「イイ色にさせるコツは？」等の質問をよく聞かれましたが特に色落ちについての質問が多かったです。お客様がデニムの購入を検討している際にシルエットや金額で選ぶのはもちろんですが色落ちでも選ぶのだなと感じていました。  
そんなお客様の疑問を一気に解決でき、さらにSNS感覚でデニムが好きな方同士でコミュニケーションが取れるようアプリケーションを開発することにしました。



# 洗い出した要件
https://docs.google.com/spreadsheets/d/1qqgjtw6PW5F_SPIOXYsXFcTtgPvu7XxTYYz52llTaQ8/edit#gid=982722306



# 実装機能
## トップページ
### 投稿がない場合
[![Image from Gyazo](https://i.gyazo.com/4eaeb71a15812d6685884662d9416cce.gif)](https://gyazo.com/4eaeb71a15812d6685884662d9416cce)


### 投稿がある場合
[![Image from Gyazo](https://i.gyazo.com/065222216301c67623f828838d328ad9.gif)](https://gyazo.com/065222216301c67623f828838d328ad9)


## ユーザー登録機能
- ユーザー登録することで投稿、お気に入り、コメントを送る、マイページのログインが出来るようになります。(ユーザー登録しなくても投稿の閲覧は可能です。)
[![Image from Gyazo](https://i.gyazo.com/baf46e166c6271dbbc85ec6f5e37e969.gif)](https://gyazo.com/baf46e166c6271dbbc85ec6f5e37e969)


## 投稿機能
- デニムのブランドをプルダウンから選択し着用年数、洗濯頻度、コメントを記入します。画像は５枚まで投稿出来ます。
[![Image from Gyazo](https://i.gyazo.com/a4caa269578c3047d45c8f598f96586e.gif)](https://gyazo.com/a4caa269578c3047d45c8f598f96586e)

## コメント、お気に入り機能
- ログインしている状態なら詳細ページから投稿に対して、コメント、お気に入りが出来ます。（コメント数、お気にり数はマイページにて確認出来ます。）
[![Image from Gyazo](https://i.gyazo.com/7df4d358460964bcb9d1f6c50c86ff68.gif)](https://gyazo.com/7df4d358460964bcb9d1f6c50c86ff68)


## 編集、削除機能
- マイページか詳細ページにて編集、削除可能。編集する際はユーザーの手間を省くために投稿時の情報は保持されています。
[![Image from Gyazo](https://i.gyazo.com/c0adff9a10e7c0eeed2116d85a862be3.gif)](https://gyazo.com/c0adff9a10e7c0eeed2116d85a862be3)



# テーブル設計

## users テーブル
| Column               | Type   | Options                      |
| ------------------   | ------ | ---------------------------- |
| name                 | string | null: false                  |
| email                | string | null: false   unique: true   |
| encrypted_password   | string | null: false                  |

### Association
- has_many :posts
- has_many :comments
- has_many :favorites




## posts テーブル
| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| content          | text       | null: false                    |
| washing_frequency| string     | null: false                    |
| wearing_years    | string     | null: false                    |
| brand_id         | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments
- has_many :favorites
- has_many_attached :images(active_storage)



## comments テーブル

| Column    | Type       | Options                        |
| ----------| ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| post      | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :post



## favorites テーブル
| Column    | Type       | Options                        |
| ----------| ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| post      | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :post


# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/a64ecc8de412c925e9c0b68640ad7e9d.png)](https://gyazo.com/a64ecc8de412c925e9c0b68640ad7e9d)


# 開発環境
- Ruby
- Rails
- MySQL
- Javascript
- jQuery


# ローカルでの動作方法
以下のコマンドを順に実行  
% git clone https://github.com/FUJITASHOGO2190/denipa.git  
% cd denipa  
% bundle install  
% yarn install  
% rails db:create  
% rails db:migrate
