# テーブル設計

## users テーブル

| Column             | Type      | Options     |
| ------------------ | ----------| ----------- |
| nickname           | string    | null: false |
| email              | string    | null: false |
| encrypted_password | string    | null: false |
| family_name        | string    | null: false |
| name               | string    | null: false |
| family_name_kana   | string    | null: false |
| name_kana          | string    | null: false |
| date               | date      | null: false |

### Association

- has_many :items
- has_many :order

## itemテーブル

| Column        | Type          | Options                        |
| ------------- | ------------- | ------------------------------ |
| user          | references    | null: false foreign_key: true  |
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

## address テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_id      | references | null: false, foreign_key: true |
| yubin        | integer    | null: false                    |
| prefectures  | text       | null: false                    |
| municipality | text       | null: false                    |
| number       | string     | null: false                    |
| building     | string     | null: null                     |
| tell         | string     | null: false                    |

### Association

- belongs_to :order

## orderテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :address
- belongs_to :user
