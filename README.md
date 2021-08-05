#テーブル設計

## users テーブル

|Column              |Type       |Options                  |
------------------------------------------------------------
|nickname            |string     |null: false              |
|email               |string     |null: false, unique: true|
|encrypted_password  |string     |null: false              |
|name_first          |string     |null: false              |
|name_last           |string     |null: false              |
|name_first_kana     |string     |null: false              |
|name_last_kana      |string     |null: false              |
|birthday            |date       |null: false              |

### Association
- has_many :items
- has_many :comments
- has_many :buys


## items テーブル
|Column              |Type       |Options                       |
----------------------------------------------------------------
|name                |string     |null: false                   |
|detail              |text       |null: false                   |
|category_id         |integer    |null: false                   |
|condition_id        |integer    |null: false                   |
|send_cost_id        |integer    |null: false                   |
|prefecture_id       |integer    |null: false                   |
|send_day_id         |integer    |null: false                   |
|price               |integer    |null: false                   |
|user                |references |null: false, foreign_key: true|

### Association
- belongs_to :user
_ has_many :comments
_ has_one :buy


## comments テーブル

|Column              |Type       |Options                       |
----------------------------------------------------------------
|comment             |text       |null: false                   |
|user                |references |null: false, foreign_key: true|
|item                |references |null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user


## buys テーブル

|Column              |Type       |Options                       |
----------------------------------------------------------------
|user                |references |null: false, foreign_key: true|
|item                |references |null: false, foreign_key: true|


### Association
- belongs_to :item
- belongs_to :user
- has_one :sent

## sents テーブル

|Column              |Type       |Options                       |
----------------------------------------------------------------
|buy                 |references |null: false, foreign_key: true|
|post_num            |string     |null: false                   |
|prefecture_id       |integer    |null: false                   |
|city                |string     |null: false                   |
|address             |string     |null: false                   |
|building            |string     |                              |
|phone               |string     |null: false


### Association
- belongs_to :buy
