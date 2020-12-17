# データベース設計

## Usersテーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_read  | string | null: false |
| first_name_read | string | null: false |
| birthday        | date   | null: false |

### Association
- has_many :Items
- has_many :Buyers

## Itemsテーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| name            | string  | null: false |
| description     | text    | null: false |
| category        | string  | null: false |
| state           | string  | null: false |
| postage_charge  | string  | null: false |
| shipment_source | string  | null: false |
| shipment_date   | string  | null: false |
| price           | integer | null: false |

### Association
- belongs_to :User
- has_one :Buyer
- has_one_attached :image

## Buyersテーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| card_number     | string  | null: false |
| card_limit      | date    | null: false |
| security_code   | string  | null: false |

### Association
- belongs_to :User
- belongs_to :Item
- has_one :Address

## Addressesテーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| postal_code | string  | null: false |
| prefectures | text    | null: false |
| city        | string  | null: false |
| number      | string  | null: false |
| building    | string  | none        |
| tel         | string  | null: false |

### Association
- belongs_to :Buyer