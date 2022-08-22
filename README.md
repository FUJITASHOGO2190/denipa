# アプリケーション名
- Denipa

# アプリケーション概要
- 履き込んだデニムの写真を投稿し、デニム好き同士で共有することが出来る。

# URL


# テスト用アカウント
- Basic認証id: admin
- Basic認証パスワード: 2222
- メールアドレス: sample1@mail
- パスワード: sss1111

# 利用方法
- トップページのヘッダーからユーザー新規登録を行う。
- 投稿ボタンから内容（着用年数、洗濯頻度、ブランド、コメント、画像）を入力し投稿する。
- 一覧ページで投稿された写真を閲覧、詳細ページにて気に入った投稿にコメント、お気に入りに登録出来る。

# アプリケーションを作成した背景
- 前職でデニムが主力なお店で販売員として働いていた時によくお客様に「このブランドのデニムはどんな風に  
色落ちするの？」「洗濯方法は？」「イイ色にさせるコツは？」等の疑問をよく聞かれました。また「ここで  
買ったデニムすごい良い色落ちしたんだ」と見せに来店して下さる顧客様が多くいらっしゃました。


# 洗い出した要件
https://docs.google.com/spreadsheets/d/1qqgjtw6PW5F_SPIOXYsXFcTtgPvu7XxTYYz52llTaQ8/edit#gid=982722306



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
| comment   | text       | null: false                    |
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