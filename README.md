# テーブル設計

## users テーブル

| Column      | Type           | Options                       |
| ----------- | -------------- | ----------------------------- |
| email       | string         | null: false                   |
| password    | string         | null: false                   |
| nickname    | string         | null: false                   |
| name        | string         | null: false                   |
| kana        | string         | null: false                   |
| birthday    | date           | null: false                   |

### Association

- has_many :items
- has_many :comments

## items テーブル

| Column        | Type          | Options                        |
| ------------- | ------------- | ------------------------------ |
| title         | string        | null: false                    |
| detail        | text          | null: false                    |
| status        | string        | null: false                    |
| image         | ActiveStorage | null: false                    |
| fee           | integer       | null: false                    |
| delivery-from | string        | null: false                    |
| delivery-days | integer       | null: false                    |
| price         | integer       | null: false                    |
| user          | references    | null: false, foreign_key: true |

### Association

- has_many: categories, through: item-categories
- has_many: comments

## comments テーブル

| Column      | Type          | Options                        |
| ----------- | ------------- | ------------------------------ |
| content     | text          | null: false                    |
| user        | references    | null: false, foreign_key: true |
| prototype   | references    | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## item-categories テーブル

| Column      | Type          | Options                        |
| ----------- | ------------- | ------------------------------ |
| item        | references    | null: false, foreign_key: true |
| category    | references    | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :category

## categories テーブル

| Column      | Type          | Options                        |
| ----------- | ------------- | ------------------------------ |
| categories  | string        | null: false                    |

### Association

- has_many :items, through: item-categories