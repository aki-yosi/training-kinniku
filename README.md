## DB 設計

## users テーブル

| Column             | Type                | Options                  |
|--------------------|---------------------|------------------------- |
| nickname           | string              | null: false              |
| password           | string              | null: false              |
| family_name        | string              | null: false              |
| first_name         | string              | null: false              |
| seibetsu           | string              | null: false              |
| email              | string              | null: false, unique: true|

### Association

* has_many :prototypes
* has_many :comments

## training テーブル

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| training_title                      | string     | null: false       |
| training_text                       | text       | null: false       |
| training_time                       | string     | null: false       |
| user                                | references | foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| text        | text       | null: false       |
| training    | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association

- belongs_to :prototype
- belongs_to :user
