# READ ME

## Users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false | 
| email            | string  | null: false |
| password         | string  | null: false |
| first_name       | string  | null: false |
| last_name        | string  | null: false |
| first_name(kana) | string  | null: false |
| last_name(kana)  | string  | null: false |
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
| category        | string     | null: false                    |
| user            | references |                                |
| item_status     | string     | null: false                    |
| shipping_charge | string     | null: false                    |
| shipping_area   | string     | null: false                    |
| days_to_ship    | string     | null: false                    |

### Association
- belongs_to :user
- has_many :purchases

## Addresses テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     | null: false                    |
| user          | references |                                |

### Association
- belongs_to :user

## purchases テーブル
| Column    | Type        | Options                        |
| --------- | ----------- | ------------------------------ |
| user_id   | integer     | null: false                    |
| item_id   | integer     | null: false                    |

### Association
- belongs_to :user
- belongs_to :item