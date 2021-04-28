## アプリケーション名
## trainingtweet

### 概要
### 作成したアプリではさまざまな人が自宅で自粛生活を送っているため体が衰えないために運動したことをtweetできるアプリを作成した。ユーザーの新規登録から登録したユーザーが投稿する機能知らない人のツイートにコメントができる機能をつけたアプリです。

 ## 本番環境

 ### url  https://training-kinniku.herokuapp.com/

 ### テストアカウント　mail text@text.com  パスワード　text11

 ## 作成背景(意図)

 ### 今回作成したアプリではこのご時世コロナで外出もままならないので自宅生活を送るにつれコロナ太りが多くなっているので自宅で簡単に筋トレをするために外部に向けて今日の筋トレ内容の発信をすることにより初見の人たちと情報交換を行い健康のために使ってもらいたいと思い作成しました。

 ## DEMO

 ### https://gyazo.com/ea61e1c0baac5823fe72e007a2263f6a

 ### トップページの画像です。ここからユーザー登録をするなり、投稿ページに遷移するなりをします。


 ###　


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

* has_many :trainings
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

- belongs_to :training
- belongs_to :user

