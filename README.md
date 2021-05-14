# README

## 開発環境

* Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code

## アプリケーション名

* Cuota

## アプリケーション概要

* 学校の先生と養護教諭(保健室の先生)などが、受け持つ生徒の情報を共有することが出来る。

## URL

* http://54.150.116.142/

## テスト用アカウント

* id       admin
* password 0115

## ログイン用アカウント

* email    yoshida@gmail
* password 2720010

## 利用方法

* ログイン後、トップページから情報の閲覧や更新を行いたい生徒のリンクから編集画面へ遷移し、必要な情報の確認、もしくは更新を行う。

## 目指した課題解決

* 生徒の担任変更や養護教諭の変更等により、重要なパーソナル情報が共有されず、確認に時間と手間が掛かるという課題の解決。

## 洗い出した要件

* ログイン機能(養護教諭)
* 生徒の情報を入力できる機能
* 生徒の情報を確認できる機能
* 生徒の情報を更新できる機能
* 学校管理機能
* 学年一括更新機能
* クラス一括更新
* 出席番号更新

<!-- ## 実装した機能についての画像やGIFおよびその説明 -->




## 実装予定の機能

* csvの読み込み
* 印刷機能
* ユーザー権限変更・譲渡機能
* 兄弟管理機能

<!-- ## データベース設計 -->



<!-- ## ローカルでの動作方法 -->

## nursing_teachers

| column                | Type         | Options                        |
| --------------------- | ------------ | ------------------------------ |
| last_name             | string       | null: false                    | 
| first_name            | string       | null: false                    |
| email                 | string       | null: false, unique: true      |
| encrypted_password    | string       | null: false                    |
| school_id             | integer      | null: false                    |

### Association

- belongs_to :school
- has_many   :students


<!-- ## schools -->
<!--  -->
<!-- | column                | Type         | Options                        | -->
<!-- | --------------------- | ------------ | ------------------------------ | -->
<!-- | name                  | string       | null: false                    |  -->
<!-- | postal_code           | integer      | null: false                    | -->
<!-- | prefectures           | string       | null: false                    | -->
<!-- | city                  | string       | null: false                    | -->
<!-- | address               | string       | null: false                    | -->
<!-- | phone_num             | integer      | null: false                    | -->
<!--  -->
<!-- ### Association -->
<!--  -->
<!-- - has_one    :nursing_teacher -->
<!-- - has_many   :students -->
<!-- - has_many   :homeroom_teachers -->


## students

| column                | Type         | Options                        |
| --------------------- | ------------ | ------------------------------ |
| last_name             | string       | null: false                    |
| first_name            | string       | null: false                    |
| last_kana             | string       | null: false                    |
| first_kana            | string       | null: false                    |
| date                  | date         |                                |
| school_year_id        | integer      | null: false                    |
| school_class_id       | integer      | null: false                    |
| number                | integer      | null: false                    |
| gender_id             | integer      | null: false                    |
| brother               | string       |                                |
| allergy               | string       |                                |
| medicine              | string       |                                |
| anaphylaxis           | string       |                                |
| allergy_other         | text         |                                |
| special_support       | text         |                                |
| other_ht              | text         |                                |
| other_nt              | text         |                                |
| school_id             | integer      | null: false                    |
| school_year_update    | integer      |                                |
| nursing_teacher       | references   | null: false, foreign_key: true |
| homeroom_teacher      | references   | null: false, foreign_key: true |

### Association

- belongs_to   :nursing_teacher
- belongs_to   :school
- belongs_to   :homeroom_teacher
- has_one      :medical_checkup


<!-- ## medical_checkups -->
<!--  -->
<!-- | column                        | Type         | Options                        | -->
<!-- | ----------------------------- | ------------ | ------------------------------ | -->
<!-- | height                        | integer      |                                | -->
<!-- | weight                        | integer      |                                | -->
<!-- | nutritional_status            | text         |                                | -->
<!-- | spine_chest_limbs             | text         |                                | -->
<!-- | right_eyesight                | string       |                                | -->
<!-- | left_eyesight                 | string       |                                | -->
<!-- | eye_diseases                  | text         |                                | -->
<!-- | hearing_right                 | string       |                                | -->
<!-- | hearing_left                  | string       |                                | -->
<!-- | otorhinolaryngology           | text         |                                | -->
<!-- | skin_disease                  | text         |                                | -->
<!-- | tuberculosis_disease          | text         |                                | -->
<!-- | tuberculosis_guidance         | text         |                                | -->
<!-- | cardiac_clinical_examination  | text         |                                | -->
<!-- | heart_disease                 | text         |                                | -->
<!-- | urine_protein_primary         | text         |                                | -->
<!-- | urine_sugar_primary           | text         |                                | -->
<!-- | urine_other                   | text         |                                | -->
<!-- | other_disease                 | text         |                                | -->
<!-- | student                       | references   | null: false, foreign_key: true | -->
<!--  -->
<!-- ### Association -->
<!--  -->
<!-- - belongs_to   :student -->


<!-- ## homeroom_teachers -->
<!--  -->
<!-- | column                | Type         | Options                        | -->
<!-- | --------------------- | ------------ | ------------------------------ | -->
<!-- | last_name             | string       | null: false                    |  -->
<!-- | first_name            | string       | null: false                    | -->
<!-- | email                 | string       | null: false, unique: true      | -->
<!-- | encrypted_password    | string       | null: false                    | -->
<!-- | school_year           | integer      | null: false                    | -->
<!-- | class                 | string       | null: false                    | -->
<!-- | school                | references   | null: false, foreign_key: true | -->
<!--  -->
<!-- ### Association -->
<!--  -->
<!-- - belongs_to :school -->
<!-- - has_many   :students -->


<!-- ## school_counselors -->
<!--  -->
<!-- | column                | Type         | Options                        | -->
<!-- | --------------------- | ------------ | ------------------------------ | -->
<!-- | last_name             | string       | null: false                    |  -->
<!-- | first_name            | string       | null: false                    | -->
<!-- | email                 | string       | null: false, unique: true      | -->
<!-- | encrypted_password    | string       | null: false                    | -->
<!-- | school                | references   | null: false, foreign_key: true | -->
<!--  -->
<!-- ### Association -->
<!--  -->
<!-- - belongs_to :school -->
<!-- - has_many   :students -->


<!-- ## managements -->
<!--  -->
<!-- | column                | Type         | Options                        | -->
<!-- | --------------------- | ------------ | ------------------------------ | -->
<!-- | position              | string       | null: false                    |  -->
<!-- | last_name             | string       | null: false                    |  -->
<!-- | first_name            | string       | null: false                    | -->
<!-- | email                 | string       | null: false, unique: true      | -->
<!-- | encrypted_password    | string       | null: false                    | -->
<!-- | school                | references   | null: false, foreign_key: true | -->
<!--  -->
<!-- ### Association -->
<!--  -->
<!-- - belongs_to :school -->
<!-- - has_many   :students -->
