## usersテーブル

|Column         |Type      |Options    |
|------         |----      |-------    |
|nickname       |string    |null:false |
|email          |string    |null:false, unique: true |
|encrypted_password|string    |null:false |
|last_name      |string    |null:false |
|first_name     |string    |null:false |
|last_name_kana |string    |null:false |
|first_name_kana|string    |null:false |
|birth_date     |date      |null:false |

### Association

・has_many :items
・has_many :purchases

## itemsテーブル

|Column          |Type      |Options    |
|------          |----      |-------    |
|user            |references|null:false, foreign_key: true |
|name            |string    |null:false |
|description     |text      |null:false |
|category_id     |integer   |null:false |
|condition_id    |integer   |null:false |
|postage_id      |integer   |null:false |
|prefecture_id   |integer   |null:false |
|handling_time_id|integer   |null:false |
|price           |integer   |null:false |

### Association

・belongs_to :user
・has_one :purchase
・belongs_to_active_hash :category
・belongs_to_active_hash :condition
・belongs_to_active_hash :postage
・belongs_to_active_hash :handling_time
・belongs_to_active_hash :prefecture

## purchasesテーブル

|Column          |Type      |Options    |
|------          |----      |-------    |
|item            |references|null:false, foreign_key: true |
|user            |references|null:false, foreign_key: true |

### Association

 ・belongs_to :user
 ・belongs_to :item
 ・has_one :address

## addressesテーブル

|Column          |Type      |Options    |
|------          |----      |-------    |
|post_code       |string    |null:false |
|prefectures_id  |integer   |null:false |
|city            |string    |null:false |
|house_number    |string    |null:false |
|building_name   |string    |           |
|phone_number    |string    |null:false |
|purchase        |references|null:false, foreign_key: true |

### Association

・belongs_to :purchase
・belongs_to :prefecture

