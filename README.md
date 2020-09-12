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

## userテーブル

| column          | Type      | Options
| --------------- | --------- | --------------------------
| nickname        | string    | null: false
| password        | string    | null: false
| first_name      | string    | null: false
| last_name       | string    | null: false
| first_name_kana | string    | null: false
| last_name_kana  | string    | null: false
| birth_date      | date      | null: false
| email           | string    | null: false, index: true

### Association

- has_many :items
- has_many :purchases.dependent: :destroy

## items

| column           | Type      | Options
| ---------------- | --------- | --------------------------------
| name             | string    | null: false
| price            | integer   | null: false
| item_info        | text      |
| category_id      | integer   | null: false
| status_id        | integer   | null: false
| delivery_fee_id  | integer   | null: false
| shipping_area_id | integer   | null: false
| delivery_days_id | integer   | null: false
| user_id          | integer   | null: false, foreign_key: true 

### Association

- has_one :purchase.dependent:destroy

## address

| column           | Type      | Options
| ---------------- | --------- | --------------------------------
| post_codo        | string    | null: false
| prefecture_id    | integer   | null: false
| city             | string    | null: false
| addresses        | string    | null: false
| building         | string    | 
| phone            | string    | null: false
| purchases_id     | integer   | null: false, foreign_key: true

### Association

- belongs_to :purchase

## purchases

| column           | Type      | Options
| ---------------- | --------- | -----------
| user_id          | integer   | null: false, foreigh_key: true
| items_id         | integer   | null: false, foreigh_key: true

### Association

- belongs_to :user
- belongs_to :item
- has_one :address.dependent: :destroy