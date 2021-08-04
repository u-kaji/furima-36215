#テーブル設計

## users テーブル

|Column              |Type       |Options    |
----------------------------------------------
|name                |string     |null: false|
|email               |string     |null: false|
|encrypted_password  |string     |null: false|

### Association
- has_many items
- has_many comments


## items テーブル
|Column              |Type       |Options    |
----------------------------------------------
|name                |string     |null: false|
|price               |integer    |null: false|
|image               |string     |null: false|
|send_cost           |string     |null: false|
|region              |string     |null: false|
|send_day            |integer    |null: false|
|detail              |text       |null: false|
|user.id             |references |null: false|
|send_day            |references |null: false|

### Association
- belongs_to user
_ has_many comments
_ has_one buyer


## comments テーブル

|Column              |Type       |Options    |
----------------------------------------------
|comment             |text       |null: false|
|user.id             |references |null: false|
|item.id             |references |null: false|

### Association
- belongs_to item
- belongs_to user


## buyer テーブル

|Column              |Type       |Options    |
----------------------------------------------
|name                |strings    |null: false|
|address             |strings    |null: false|
|item.id             |references |null: false|

### Association
- belongs_to item
