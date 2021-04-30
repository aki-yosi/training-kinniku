## アプリケーション名
## trainingtweet

## 概要
#### 作成したアプリではさまざまな人が自宅で自粛生活を送っているため体が衰えないために運動したことをtweetできるアプリを作成した。ユーザーの新規登録から登録したユーザーが投稿する機能知らない人のツイートにコメントができる機能をつけたアプリです。

 ## 本番環境

 ### url  https://training-kinniku.herokuapp.com/
 ### Basic認証(就職活動中は停止中)
 #### ユーザー名： admin
 #### パスワード： 2222

 ### テストアカウント　mail text@text.com  パスワード　text11

 ## 作成背景(意図)

 #### 今回作成したアプリではこのご時世コロナで外出もままならないので自宅生活を送るにつれコロナ太りが多くなっているので自宅で簡単に筋トレをするために外部に向けて今日の筋トレ内容の発信をすることにより初見の人たちと情報交換を行い健康のために使ってもらいたいと思い作成しました。

 ## DEMO

 ### ![](https://gyazo.com/762dea537fd9ced3e720495e0642107a.pn)

 ### トップページの画像です。ここからユーザー登録をするなり、投稿ページに遷移するなりをします。


 ###　![](https://gyazo.com/57a29a96fa045325e951ce22c0a4b062.png)

 ###　新規登録ページです、今回フリマで初めて使ったパスワードは英数字混合のバリーデーションをつけました。

 ### ![](https://gyazo.com/944a9f4a8dab294c432a98aea40b6e4c.png)
 
 ### 投稿ページです。今回は画像などを用いないで投稿する使用にしました。この使用なら簡単に投稿ができます。


### ![](https://gyazo.com/1cbe626aeb2dd5c12686dbcb6e298531.png)

### 詳細ページとコメントを行うページです。枠が大きいのはみやすさを重視したので枠が大きいです。


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

