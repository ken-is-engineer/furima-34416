# テーブル設計

## users テーブル

| Column                | Type           | Options                       |
| --------------------- | -------------- | ----------------------------- |
| email                 | string         | null: false, unique: true     |
| encrypted_password    | string         | null: false                   |
| nickname              | string         | null: false                   |
| first_name            | string         | null: false                   |
| last_name             | string         | null: false                   |
| first_kana            | string         | null: false                   |
| last_kana             | string         | null: false                   |
| birthday              | date           | null: false                   |

### Association

- has_many :items
- has_many :comments
- has_many :address

## items テーブル

| Column        | Type          | Options                        |
| ------------- | ------------- | ------------------------------ |
| title         | string        | null: false                    |
| detail        | text          | null: false                    |
| status_id     | integer       | null: false                    | active_hash
| fee_id        | integer       | null: false                    | active_hash
| from_id       | integer       | null: false                    | active_hash
| days_id       | integer       | null: false                    | active_hash
| category_id   | integer       | null: false                    | active_hash
| price         | integer       | null: false                    |
| user          | references    | null: false, foreign_key: true |

### Association

- has_many   :comments
- belongs_to :purchase

## comments テーブル

| Column      | Type          | Options                        |
| ----------- | ------------- | ------------------------------ |
| content     | text          | null: false                    |
| user        | references    | null: false, foreign_key: true |
| prototype   | references    | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## purchases テーブル

| Column      | Type          | Options                        |
| ----------- | ------------- | ------------------------------ |
| card        | string        | null: false                    |
| address     | references    | null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :address

## Address テーブル

| Column        | Type          | Options                        |
| ------------- | ------------- | ------------------------------ |
| post_code     | integer       | null: false                    |
| prefecture    | string        | null: false                    |
| city          | string        | null: false                    |
| address_line1 | string        | null: false                    |
| address_line2 | string        | null: false                    |
| phone_number  | integer       | null: false                    |

### Association

- has_many   :purchase
- belongs_to :user