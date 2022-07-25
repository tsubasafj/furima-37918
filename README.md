## テーブル設計

## users テーブル

| Column             | Type   | Option                    |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column           | Type       | Option                        |
| ---------------- | ---------- | ----------------------------- |
| name             | string     | null: false                   |
| content          | text       | null: false                   |
| price            | integer    | null: false                   |
| user             | references | null: false foreign_key: true |
| category_id      | integer    | null: false                   |
| condition_id     | integer    | null: false                   |
| shipping_fee_id  | integer    | null: false                   |
| prefecture_id    | integer    | null: false                   |
| shipping_time_id | integer    | null: false                   |

### Association

- belongs_to :user
- has_one :purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_fee
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :shipping_time


## purchases テーブル

| Column    | Type       | Option                        |
| --------- | ---------- | ----------------------------- |
| user      | references | null: false foreign_key: true |
| item      | references | null: false foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address


## shipping_addresses テーブル

| Column        | Type       | Option                        |
| ------------- | ---------- | ----------------------------- |
| zip_code      | string     | null: false                   |
| prefecture_id | integer    | null: false,                  |
| city          | string     | null: false                   |
| address_line1 | string     | null: false                   |
| address_line2 | string     |                               |
| phone_number  | string     | null: false                   |
| purchase      | references | null: false foreign_key: true |

### Association

- belongs_to :purchase
- belongs_to_active_hash :prefecture