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

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |

## items テーブル

| Column             | Type       | Options                        |
| ------             | ------     | -----------                    |
| product name       | string     | null: false                    |
| category           | string     | null: false                    |
| price              | string     | null: false                    |
| seller             | string     | null: false                    |

## purchase record テーブル

| Column             | Type       | Options                        |
| ------             | ---------- | ------------------------------ |
| buyer              | string     | null: false                    |
| shipping address   | string     | null: false                    |

## shipping information テーブル

| Column             | Type       | Options                        |
| ------             | ---------- | ------------------------------ |
| shipping address   | string     | null: false                    |