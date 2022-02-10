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
| last-name          | string | null: false                        |
| first-name         | string | null: false                        |
| last-name-kana     | string | null: false                        |
| first-name-kana    | string | null: false                        |
| user_birth_date    | string | null: false                        |

## items テーブル

| Column             | Type       | Options                        |
| ------             | ------     | -----------                    |
| product name       | string     | null: false, foreign_key: true |
| category_id        | integer    | null: false, foreign_key: true |
| price              | integer    | null: false                    |
| seller             | string     | null: false                    |

## purchase_record テーブル

| Column             | Type       | Options                        |
| ------             | ---------- | ------------------------------ |
| buyer              | string     | null: false, foreign_key: true |
| shipping_address   | string     | null: false, foreign_key: true |

## shipping_information テーブル

| Column             | Type       | Options                        |
| ------             | ---------- | ------------------------------ |
| shipping_address   | string     | null: false, foreign_key: true |
| card-number        | string     | null: false, foreign_key: true |
| card-number        | string     | null: false, foreign_key: true |
| card-exp           | string     | null: false, foreign_key: true |
| card-cvc           | string     | null: false, foreign_key: true |
| postal-code        | string     | null: false, foreign_key: true |
| prefecture         | string     | null: false, foreign_key: true |
| city               | string     | null: false, foreign_key: true |
| addresses          | string     | null: false, foreign_key: true |
| phone-number       | string     | null: false, foreign_key: true |