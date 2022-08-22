# アプリケーション名
- Denipa

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
