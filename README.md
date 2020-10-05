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
- has_many :purchases

## Items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| price              | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
| item_description   | text       | null: false                    |
| item_status_id     | integer    | null: false                    |
| shipping_charge_id | integer    | null: false                    |
| shipping_area_id   | integer    | null: false                    |
| days_to_ship_id    | integer    | null: false                    |

### Association
- belongs_to :user
- has_one :purchase

## Addresses テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase

## purchases テーブル
| Column    | Type           | Options                        |
| --------- | -------------- | ------------------------------ |
| user      | references     | null: false, foreign_key: true |
| item      | references     | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address