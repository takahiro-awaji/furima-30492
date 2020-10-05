# READ ME

## Users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false | 
| email            | string  | null: false |
| password         | string  | null: false |
| first_name       | string  | null: false |
| last_name        | string  | null: false |
| first_name_kana  | string  | null: false |
| last_name_kana   | string  | null: false |
| birthday         | date    | null: false |

### Association
- has_many :items
- has_one :address
- has_many :purchases

## Items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| price           | integer    | null: false                    |
| category        | integer    | null: false                    |
| user            | references | foreign_key: true              |
| item_status     | integer    | null: false                    |
| shipping_charge | integer    | null: false                    |
| shipping_area   | integer    | null: false                    |
| days_to_ship    | integer    | null: false                    |

### Association
- belongs_to :user
- has_one :purchase

## Addresses テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     | null: false                    |
| purchase      | references | foreign_key: true              |

### Association
- belongs_to :purchase

## purchases テーブル
| Column    | Type           | Options                        |
| --------- | -------------- | ------------------------------ |
| user      | references     | foreign_key: true              |
| item      | references     | foreign_key: true              |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address