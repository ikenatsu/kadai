# アプリケーション名
problem
# アプリケーション概要
ユーザーの問題発見をサポートするアプリ。

　従来、多くの人が色々な課題を見つけては解決し、今の便利な世の中が形成されている。
多くの課題が解決されてきた昨今、解決するだけでなく、今ある日常の中でいかに課題を見つけるか、
そこに大きな価値があると考える。
本アプリは、そんな「課題発見」に重きを重きをおき、そのサポートができるアプリとする。

# 要件定義
https://docs.google.com/spreadsheets/d/1YIhs6jYhF6VZusfka8yasIxwCVkHVKDxwH6N3OwA_Ak/edit#gid=982722306

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/8cc9a52f3f6ccd9d4ab4c6c181e3b781.png)](https://gyazo.com/8cc9a52f3f6ccd9d4ab4c6c181e3b781)
## users テーブル
| Column                 | Type     | Options                   |
| -----------------------| -------- | ------------------------- |
| nickname               | string   | null: false               |
| email                  | string   | null: false, unique: true |
| encrypted_password     | string   | null: false               |
| gender_id              | integer  | null: false, unique: true |
| age                    | integer  | null: false, unique: true |
| occupation_id          | integer  | null: false, unique: true |
| family_id              | integer  | null: false, unique: true |

### Association

- has_many :problem_users
- has_many :problems, through: :problem_users
- has_many :comments

## problems テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| problem_title          | string     | null: false                    |
| message                | text       | null: false                    |
| standpoint_id          | integer    | null: false                    |
| concreteness_id        | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |


### Association

- has_many :problem_user
- has_many :users, through: :problem_users
- has_many :comments


## problem_users テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| problem | references | null: false, foreign_key: true |

### Association

- belongs_to :problem
- belongs_to :user


## comments テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| content       | string     |                                |
| user          | references | null: false, foreign_key: true |
| problem       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :problem