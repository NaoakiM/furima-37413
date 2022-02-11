# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# テーブル設計

## users テーブル

| Column             | Type   | Options                            |
| ------------------ | ------ | -----------                        |
| nickname           | string | null: false                        |
| email              | string | null: false, unique: true          |
| encrypted_password | string | null: false                        |
| last_name          | string | null: false                        |
| first_name         | string | null: false                        |
| last_name_kana     | string | null: false                        |
| first_name_kana    | string | null: false                        |
| user_birth_date    | date   | null: false                        |

### アソシエーション


## items テーブル

| Column                        | Type       | Options                        |
| ------                        | ------     | -----------                    |
| item_image                    | string     | null: false                    |
| item_name                     | string     | null: false                    |
| item_info                     | string     | null: false                    |
| item_category                 | string     | null: false                    |
| item_sales_status             | string     | null: false                    |
| item_shipping_fee_status      | string     | null: false                    |
| item_prefecture               | string     | null: false                    |
| item_scheduled_delivery       | string     | null: false                    |
| item_price                    | integer    | null: false                    |
| category_id                   | integer    | null: false                    |
| price                         | integer    | null: false                    |
| user                          | references | null: false, foreign_key: true |

### アソシエーション


## purchase_record テーブル

| Column             | Type       | Options                        |
| ------             | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### アソシエーション


## shipping_information テーブル

| Column             | Type       | Options                        |
| ------             | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture         | integer    | null: false                    |
| city               | string     | null: false                    |
| addresses          | string     | null: false                    |
| building           | string     | null: false                    |
| phone_number       | string     | null: false                    |

### アソシエーション