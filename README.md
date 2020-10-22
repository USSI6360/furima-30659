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
- has_many :orders

## itemテーブル

| Column        | Type          | Options                        |
| ------------- | ------------- | ------------------------------ |
| user          | references    | null: false foreign_key: true  |
| product_name  | string        | null: false                    |
| instructions  | text          | null: false                    |
| category_id   | integer       | null: false                    |
| status_id     | integer       | null: false                    |
| burden_id     | integer       | null: false                    |
| area_id       | integer       | null: false                    |
| prefecture_id | integer       | null: false                    |
| days_id       | integer       | null: false                    |
| price         | integer       | null: false                    |

### Association

- belongs_to :user
- has_one_to :order

## address テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| order          | references | null: false, foreign_key: true |
| yubin          | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| municipality   | string     | null: false                    |
| number         | string     | null: false                    |
| building       | string     |                                |
| tell           | string     | null: false                    |

### Association

- has_one :order

## orderテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :address
- belongs_to :user
