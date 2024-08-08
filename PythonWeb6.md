# PythonWEB演習6

## メニューデータをMySQLに格納する
**テーブル:categories**
|Field|Type|Null|Key|Default|Extra|
|:---|:---|:---|:---|:---|:---|
|category_id|tinyint(1)| NO|PRI|NULL||
|category_name|varchar(64)|YES||NULL||

**テーブル:menus**
|Field|Type|Null|Key|Default|Extra|
|:---|:---|:---|:---|:---|:---|
| id          | int          | NO   | PRI | NULL    | auto_increment |
| item_name   | varchar(64)  | NO   |     | NULL    |                |
| category_id | tinyint(1)   | YES  | MUL | NULL    |                |
| image_name  | varchar(128) | YES  |     | NULL    |                |
| price       | int          | YES  |     | NULL    |                |