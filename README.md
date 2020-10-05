# READ ME

## Users テーブル

| Column   | Type    | Options     |
| -------- | ------- |-------------|
| nickname | string  | null: false | 
| email    | string  | null: false |
| password | string  | null: false |
| name     | string  | null: false |
| birthday | integer | null: false |

### Association
- belong_to :item
## Items テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| name     | string     | null: false                    |
| price    | integer    | null: false                    |
| category | string     | null: false                    |
| seller   | string     | null: false                    |
| image    | text       | null: false                    |
| user_id  | references | null: false, foreign_key: true |

### Association
- has_many :users
