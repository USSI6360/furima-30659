# テーブル設計

## users テーブル

| Column     | Type      | Options     |
| ---------- | ----------| ----------- |
| nickname   | string    | null: false |
| email      | string    | null: false |
| password   | string    | null: false |
| nyouji     | string    | null: false |
| name       | string    | null: false |
| nyouji_kana| string    | null: false |
| name_kana  | string    | null: false |
| year       | integer   | null: false |
| month      | integer   | null: false |
| day        | integer   | null: false |

### Association

- has_many :items_users
- has_one :address
- has_many :order_users

## itemテーブル

| Column        | Type          | Options                        |
| ------------- | ------------- | ------------------------------ |
| user_id       | references    | null: false foreign_key: true  |
| image         | string        | null: false                    |
| product       | string        | null: false                    |
| instructions  | text          | null: false                    |
| category      | string        | null: false                    |
| status        | string        | null: false                    |
| burden        | text          | null: false                    |
| area          | text          | null: false                    |
| days          | integer       | null: false                    |
| price         | integer       | null: false                    |

### Association

- belongs_to :user
- belongs_to :order
- has_one :item

## address テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_id      | references | null: false, foreign_key: true |
| yubin        | integer    | null: false                    |
| prefectures  | text       | null: false                    |
| municipality | text       | null: false                    |
| number       | integer    | null: false                    |
| building     | text       | null: false                    |
| tell         | integer    | null: false                    |
| days         | integer    | null: false                    |
| price        | integer    | null: false                    |

### Association

- has_one :item
- has_one :user
- has_one :order

## orderテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_id      | references | null: false, foreign_key: true |
| item_id      | references | null: false, foreign_key: true |
| time         | time       | null: false                    |

### Association

- has_one :item
- has_one :address
- belongs_to :user
