# データベース設計

## Usersテーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false              |
| last_name          | string | null: false              |
| first_name         | string | null: false              |
| last_name_read     | string | null: false              |
| first_name_read    | string | null: false              |
| birthday           | date   | null: false              |

### Association
- has_many :items
- has_many :buyers

## Itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| state_id           | integer    | null: false                    |
| postage_charge_id  | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| shipment_date_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :buyer
- has_one_attached :image

## Ordersテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## Addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| number        | string     | null: false                    |
| building      | string     | none                           |
| tel           | string     | null: false                    |
| buyer         | references | null: false, foreign_key: true |
### Association
- belongs_to :buyer