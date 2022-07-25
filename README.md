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
| birth_date         | string | null: false               |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column     | Type       | Option                        |
| ---------- | ---------- | ----------------------------- |
| name       | string     | null: false                   |
| content    | text       | null: false                   |
| price      | integer    | null: false                   |
| user       | references | null: false foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

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

| Column         | Type       | Option                        |
| -------------- | ---------- | ----------------------------- |
| zip_code       | string     | null: false                   |
| prefecture     | string     | null: false,                  |
| city           | string     | null: false                   |
| address_line1  | text       | null: false                   |
| address_line2  | text       |                               |
| phone_number   | integer    | null: false                   |
| purchase_id    | references | null: false foreign_key: true |

### Association

- belongs_to :purchase