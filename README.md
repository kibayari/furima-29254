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

## フリマアプリ課題 DB設計

## userテーブル

| column          | Type      | Options
| --------------- | --------- | --------------------------
| nickname        | string    | null: false
| password        | string    | null: false
| first_name      | string    | null: false
| last_name       | string    | null: false
| first_name_kana | string    | null: false
| last_name_kana  | string    | null: false
| birth_1i        | date      | null: false
| birth_2i        | date      | null: false
| birth_3i        | date      | null: false
| email           | string    | null: false, index: true

### Association

- has_many :comments.dependent:destroy
- has_one :card.dependent:destroy
- has_one :purchases.dependent:destroy

## items

| column           | Type      | Options
| ---------------- | --------- | --------------------------------
| name             | string    | null: false
| price            | integer   | null: false
| item_info        | text      |
| category         | integer   | null: false
| status           | integer   | null: false
| user_id          | integer   | null: false, foreigh_key: true 

### Association

- has_one :purchases.dependent:destroy
- has_many :comments.dependent:destroy

## address

| column           | Type      | Options
| ---------------- | --------- | --------------------------------
| post_codo        | integer   | null: false
| prefecture       | string    | null: false
| city             | string    | null: false
| addresses        | string    | null: false
| building         | string    | 
| phone            | integer   | null: false
| user_id          | integer   | null: false, foreigh_key: true

### Association

- belong_to :purchases

## card

| column           | Type      | Options
| ---------------- | --------- | --------------------------------
| card_number      | integer   | null: false
| year             | integer   | null: false
| month            | integer   | null: false
| security_number  | integer   | null: false
| user_id          | integer   | null: false, foreigh_key: true

### Association

- belong_to :user

## purchases

| column           | Type      | Options
| ---------------- | --------- | -----------
| user_id          | integer   | null: false, foreigh_key: true
| items_id         | integer   | null: false, foreigh_key: true

### Association

- belong_to :user
- belong_to :user
- has_one :address.dependent:destroy