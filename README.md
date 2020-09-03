# ER図
  [ER図](https://app.lucidchart.com/invitations/accept/ec147795-6b8e-4652-906f-80fa59b4bd0a)

# DB設計
## users テーブル

|      Column      |  Type  |          Options          |
| ---------------- | ------ | ------------------------- |
| nickname         | string | null: false, unique: true |
| email            | string | null: false, unique: true |
| password         | string | null: false               |
| family_name      | string | null: false               |
| first_name       | string | null: false               |
| family_name_kana | string | null: false               |
| first_name_kana  | string | null: false               |
| birth_date       | date   | null: false               |

### Association
- has_many :items
- has_many :purchases

## itemsテーブル

|      Column      |    Type    |             Options            |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| image            | string     | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| postage_payer_id | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| handing_time_id  | integer    | null: false                    |
| price            | integer    | null: false                    |

### Association
- has_one :purchase
- belongs_to :user
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :postage_payer
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :handing_time

## addressesテーブル

|     Column     |    Type    |            Options             |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefectures_id | integer    | null: false, foreign_key: true |
| city           | string     | null: false                    |
| home_number    | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| purchase       | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase
- belongs_to_active_hash :prefecture

## purchases テーブル

| Column |    Type    |            Options             |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address
