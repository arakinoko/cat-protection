# アプリケーション名

保護猫村

# アプリケーションの概要
猫を保護した人や団体が保護猫を紹介し、希望に合った猫に対し里親希望できる保護猫紹介アプリケーションです。


# URL
https://cat-protection.onrender.com

# テスト用アカウント
・Basic認証パスワード：2222  
・Basic認証ID：admin  
・メールアドレス：  
・パスワード：  

# 利用方法
## 保護猫投稿
1.  
2.

## 里親希望
1.  
2.

# アプリケーションを作成した背景
殺処分される猫がなくなるようにしたい、一人でも多くの人に保護猫の存在を知ってもらいたい、不幸な猫を１匹でも減らしたいという気持ちで作成しました。
このアプリケーションを通して、ペットショップからの購入以外にも保護猫という選択肢を身近に感じてもらいたい。


# 洗い出した要件
https://docs.google.com/spreadsheets/d/1sUZuY5qie7rA0r0v0-q4od1Cphyb2-sJ6LNnESpKq3M/edit?usp=drive_link

# 実装した機能についての画像やGIFおよびその説明

# 実装予定の機能


# データベース設計
[![Image from Gyazo](https://i.gyazo.com/6e4b66240689216df6c0b02592aab320.png)](https://gyazo.com/6e4b66240689216df6c0b02592aab320)

# 画面遷移
[![Image from Gyazo](https://i.gyazo.com/7f31e1b77feed7facf3ef5ba6c4aef07.png)](https://gyazo.com/7f31e1b77feed7facf3ef5ba6c4aef07)

# 開発環境
・フロントエイド
・バックエンド
・インフラ
・テスト
・テキストエディタ
・タスク管理

# ローカルでの動作方法

# 工夫したポイント




## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |

has_many :protections
has_many :forsters
 


## address テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| block              | string     | null: false                    |
| building           | string     |                                |
| phone_number       | string     | null: false                    |
| forster            | references | null: false, foreign_key: true |

belongs_to :forster

## protections テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | text       | null: false                    |
| age              | integer    | null: false                    |
| gender_id        | integer    | null: false                    |
| cat_species_id   | integer    | null: false                    |
| character        | text       | null: false                    |
| user             | references | null: false, foreign_key: true |

belongs_to :user 
has_one :forster
belongs_to :gender
belongs_to :cat_species


## forsters テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| protection | references | null: false, foreign_key: true |

belongs_to :protection
belongs_to :user
has_one :address