# テーブル設計

## users テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| last_name         | string | null: false |
| first_name        | string | null: false |
| last_name_kana    | string | null: false |
| first_name_kana   | string | null: false |
| birthday          | string | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column          | Type   | Options                            |
| --------------- | ------ | ---------------------------------- |
| product         | text   | null: false                        |
| description     | text   | null: false                        |
| category        | string | null: false                        |
| condition       | string | null: false                        |
| ship_base       | string | null: false                        |
| ship_date       | string | null: false                        |
| ship_to_address | string | null: false                        |
| price           | string | null: false                        |
| user            | references | null: false, foreign_key: true |

### Association

- has_one :item
- belongs_to :user

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| cord_number   | string     | null: false                    |
| exp_month     | string     | null: false                    |
| exp_year      | string     | null: false                    |
| approval_cord | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item
- has_one :address

## address テーブル

| Column  | Type            | Options                        |
| ------- | --------------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| state        | string     | null: false                    |
| city         | string     | null: false                    |
| block        | string     | null: false                    |
| building     | string     | null: false                    |
| phone_number | string     | null: false                    |
| order        | references | null: false, foreign_key: true |

### Association

- belongs_to :order
