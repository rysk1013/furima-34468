# テーブル設計

## users テーブル

| Column         | Type        | Options                   |
| -------------- | ----------- | ------------------------- |
| email          | string      | null: false, unique: true |
| password       | string      | null: false               |
| nickname       | string      | null: false, unique: true |
| last_name      | string      | null: false               |
| first_name     | string      | null: false               |
| last_name_kana | string      | null: false               |
| birthday       | integer     | null: false               |


### Association

- has_many :items
- has_many :records


## items テーブル

| Column             | Type          | Options           |
| ------------------ | ------------- | ----------------- |
| image              | ActiveStorage | ActiveStorage     |
| name               | string        | null: false       |
| info               | text          | null: false       |
| category           | integer       | null: false       |
| sales_status       | integer       | null: false       |
| shipping_fee       | integer       | null: false       |
| prefecture         | integer       | null: false       |
| scheduled_delivery | integer       | null: false       |
| price              | integer       | null: false       |
| user               | references    | foreign_key: true |

### Association

- belongs_to :user
- has_one :record

## records テーブル

| Column     | Type        | Options           |
| ---------- | ----------- | ----------------- |
| user       | references  | foreign_key :true |
| item       | references  | foreign_key :true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :place


## places テーブル

| Column        | Type        | Options           |
| ------------- | ----------- | ----------------- |
| postal_code   | integer     | null: false       |
| prefecture    | integer     | null: false       |
| city          | string      | null: false       |
| addresses     | string      | null: false       |
| building      | string      |                   |
| phone_number  | integer     | null: false       |

### Association

- belongs_to :record