# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## nursing_teachers

| column                | Type         | Options                        |
| --------------------- | ------------ | ------------------------------ |
| last_name             | string       | null: false                    | 
| first_name            | string       | null: false                    |
| email                 | string       | null: false, unique: true      |
| encrypted_password    | string       | null: false                    |
| school                | references   | null: false, foreign_key: true |

### Association

- belongs_to :school
- has_many   :students


## schools

| column                | Type         | Options                        |
| --------------------- | ------------ | ------------------------------ |
| name                  | string       | null: false                    | 
| postal_code           | integer      | null: false                    |
| prefectures           | string       | null: false                    |
| city                  | string       | null: false                    |
| address               | string       | null: false                    |
| phone_num             | integer      | null: false                    |

### Association

- has_one    :nursing_teacher
- has_many   :students
- has_many   :homeroom_teachers


## students

| column                | Type         | Options                        |
| --------------------- | ------------ | ------------------------------ |
| last_name             | string       | null: false                    |
| first_name            | string       | null: false                    |
| date                  | date         |                                |
| school_year           | integer      | null: false                    |
| class                 | string       | null: false                    |
| number                | integer      | null: false                    |
| gender                | string       | null: false                    |
| brother               | string       |                                |
| allergy               | text         |                                |
| special_support       | text         |                                |
| other_ht              | text         |                                |
| other_nt              | text         |                                |
| school                | references   | null: false, foreign_key: true |
| nursing_teacher       | references   | null: false, foreign_key: true |
| homeroom_teacher      | references   | null: false, foreign_key: true |

### Association

- belongs_to   :nursing_teacher
- belongs_to   :school
- belongs_to   :homeroom_teacher
- has_one      :medical_checkup


## medical_checkups

| column                        | Type         | Options                        |
| ----------------------------- | ------------ | ------------------------------ |
| height                        | integer      |                                |
| weight                        | integer      |                                |
| nutritional_status            | text         |                                |
| spine_chest_limbs             | text         |                                |
| right_eyesight                | string       |                                |
| left_eyesight                 | string       |                                |
| eye_diseases                  | text         |                                |
| hearing_right                 | string       |                                |
| hearing_left                  | string       |                                |
| otorhinolaryngology           | text         |                                |
| skin_disease                  | text         |                                |
| tuberculosis_disease          | text         |                                |
| tuberculosis_guidance         | text         |                                |
| cardiac_clinical_examination  | text         |                                |
| heart_disease                 | text         |                                |
| urine_protein_primary         | text         |                                |
| urine_sugar_primary           | text         |                                |
| urine_other                   | text         |                                |
| other_disease                 | text         |                                |
| student                       | references   | null: false, foreign_key: true |

### Association

- belongs_to   :student


## homeroom_teachers

| column                | Type         | Options                        |
| --------------------- | ------------ | ------------------------------ |
| last_name             | string       | null: false                    | 
| first_name            | string       | null: false                    |
| email                 | string       | null: false, unique: true      |
| encrypted_password    | string       | null: false                    |
| school_year           | integer      | null: false                    |
| class                 | string       | null: false                    |
| school                | references   | null: false, foreign_key: true |

### Association

- belongs_to :school
- has_many   :students


## school_counselors

| column                | Type         | Options                        |
| --------------------- | ------------ | ------------------------------ |
| last_name             | string       | null: false                    | 
| first_name            | string       | null: false                    |
| email                 | string       | null: false, unique: true      |
| encrypted_password    | string       | null: false                    |
| school                | references   | null: false, foreign_key: true |

### Association

- belongs_to :school
- has_many   :students


## managements

| column                | Type         | Options                        |
| --------------------- | ------------ | ------------------------------ |
| position              | string       | null: false                    | 
| last_name             | string       | null: false                    | 
| first_name            | string       | null: false                    |
| email                 | string       | null: false, unique: true      |
| encrypted_password    | string       | null: false                    |
| school                | references   | null: false, foreign_key: true |

### Association

- belongs_to :school
- has_many   :students
