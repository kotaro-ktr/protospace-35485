# README

# users table
| column     | type   | option      |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| profile    | text   | null: false |
| occupation | text   | null: false |
| position   | text   | null: false |

# Association

- has_many: comments
- has_many: prototypes

# prototypes table
| column     | type       | option      |
| ---------- | ---------- | ----------- |
| title      | string     | null: false |
| catch-copy | text       | null: false |
| concept    | text       | null: false |
| image      |            |             |
| user       | references |             |

# Association

- belongs_to: user
- has_many: comments

# comments table
| column    | type       | option      |
| --------- | ---------- | ----------- |
| text      | text       | null: false |
| user      | references |             |
| prototype | references |             |

# Association

- belongs_to: user
- belongs_to: prototype
