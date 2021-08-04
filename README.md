#テーブル設計

## users テーブル

|Column              |Type       |Options                  |
------------------------------------------------------------
|nickname            |string     |null: false              |
|email               |string     |null: false, unique: true|
|encrypted_password  |string     |null: false              |
|name.first          |string     |null: false              |
|name.last           |string     |null: false              |
|name.first.kana     |string     |null: false              |
|name.last.kana      |string     |null: false              |
|birth.year          |integer    |null: false              |
|birth.month         |integer    |null: false              |
|birth.day           |integer    |null: false              |

### Association
- has_many :items
- has_many :comments
- has_many :buying


## items テーブル
|Column              |Type       |Options                       |
----------------------------------------------------------------
|name                |string     |null: false                   |
|detail              |text       |null: false                   |
|category_id         |active_hash|null: false                   |
|condition_id        |active_hash|null: false                   |
|send_cost_id        |active_hash|null: false                   |
|region_id           |active_hash|null: false                   |
|send_day_id         |active_hash|null: false                   |
|price               |integer    |null: false                   |
|user                |references |null: false, foreign_key: true|

### Association
- belongs_to :user
_ has_many :comments
_ has_one :buyer


## comments テーブル

|Column              |Type       |Options                       |
----------------------------------------------------------------
|comment             |text       |null: false                   |
|user                |references |null: false, foreign_key: true|
|item                |references |null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user


## buying テーブル

|Column              |Type       |Options                       |
----------------------------------------------------------------
|user                |references |null: false, foreign_key: true|
|item                |references |null: false, foreign_key: true|


### Association
- belongs_to :item
- belongs_to :user
- has_one :sent

## sent テーブル

|Column              |Type       |Options                       |
----------------------------------------------------------------
|buying              |references |null: false, foreign_key: true|
|post_num            |integer    |null: false                   |
|Prefecture          |active_hash|null: false                   |
|city                |string     |null: false                   |
|address             |string     |null: false                   |
|building            |string     |null: false                   |
|phone               |integer    |null: false
|credit_card_num     |integer    |null: false                   |
|card_limit_month    |integer    |null: false                   |
|card_limit_year     |integer    |null: false                   |
|security_cord       |integer    |null: false                   |



### Association
- belongs_to :sent
