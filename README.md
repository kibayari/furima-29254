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
- has_many :orders.dependent: :destroy

## items

| column           | Type      | Options
| ---------------- | --------- | --------------------------------
| name             | string    | null: false
| price            | integer   | null: false
| item_info        | text      |
| genre_id         | integer   | null: false
| comdition_id     | integer   | null: false
| delivery_id      | integer   | null: false
| shipping_id      | integer   | null: false
| deliveryday_id   | integer   | null: false
| user_id          | integer   | null: false, foreign_key: true 

### Association

- has_one :order.dependent:destroy
- belongs_to :user

## addresses

| column           | Type      | Options
| ---------------- | --------- | --------------------------------
| post_codo        | string    | null: false
| shipping_id      | integer   | null: false
| city             | string    | null: false
| addresses        | string    | null: false
| building         | string    | 
| phone            | string    | null: false
| order_id         | integer   | null: false, foreign_key: true

### Association

- belongs_to :purchase

## orders

| column           | Type      | Options
| ---------------- | --------- | -----------
| user_id          | integer   | null: false, foreigh_key: true
| items_id         | integer   | null: false, foreigh_key: true

### Association

- belongs_to :user
- belongs_to :item
- has_one :address.dependent: :destroy