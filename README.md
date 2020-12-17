# データベース設計

## Usersテーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false, unique:true |
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false              |
| last_name          | string | null: false              |
| first_name         | string | null: false              |
| last_name_read     | string | null: false              |
| first_name_read    | string | null: false              |
| birthday           | date   | null: false              |

### Association
- has_many :Items
- has_many :Buyers

## Itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| state_id           | integer    | null: false                    |
| postage_charge_id  | integer    | null: false                    |
| shipment_source_id | integer    | null: false                    |
| shipment_date_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |

### Association
- belongs_to :User
- has_one :Buyer
- has_one_attached :image

## Buyersテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user_id    | references | null: false, foreign_key: true |
| item_id    | references | null: false, foreign_key: true |
| address_id | references | null: false, foreign_key: true |

### Association
- belongs_to :User
- belongs_to :Item
- has_one :Address

## Addressesテーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | string  | null: false |
| prefecture_id | integer | null: false |
| city          | string  | null: false |
| number        | string  | null: false |
| building      | string  | none        |
| tel           | string  | null: false |

### Association
- belongs_to :Buyer