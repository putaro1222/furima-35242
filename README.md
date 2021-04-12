# テーブル設計

## users テーブル

| Column                      | Type   | Options      |
| --------------------------- | ------ | -----------  |
| nickname                    | string | null: false  |
| email                       | string | unique: true |
| encrypted_password          | string | null: false  |
| last_name                   | string | null: false  |
| first_name                  | string | null: false  |
| last_name_kana              | string | null: false  |
| first_name_kana             | string | null: false  |
| birthday                    | date   | null: false  |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| product       | string     | null: false                    |
| description   | text       | null: false                    |
| category_id   | integer    | null: false                    |
| condition_id  | integer    | null: false                    |
| ship_base_id  | integer    | null: false                    |
| ship_date_id  | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- has_one :order
- belongs_to :user

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column       | Type            | Options                        |
| ------------ | --------------- | ------------------------------ |
| postal_code  | string          | null: false                    |
| prefecture   | integer         | null: false                    |
| city         | string          | null: false                    |
| block        | string          | null: false                    |
| building     | string          |                                |
| phone_number | string          | null: false                    |
| order        | references      | null: false, foreign_key: true |

### Association

- belongs_to :order
