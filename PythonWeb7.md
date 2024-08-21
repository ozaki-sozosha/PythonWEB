# PythonWEB演習7

## POSTデータの送信
お問い合わせページからPOSTリクエストを送信する

## HTML側の準備
```
<form action="" method="POST">
....中略
</form>
```
## app.py側の処理
以下は記述例です
```
@app.route("/contact",methods=["GET", "POST"])
if request.method == "GET":
        return render_template("contact.html",categories=categories)
    else:
        kind = request.form.get("kind")
        first = request.form.get('first')
        # チェックボックス項目はリストで受け取る
        how = request.form.getlist("how")
        subject = request.form.get('subject')
        message = request.form.get('message')
        # 以下略
```

## 送信結果をDBに保存する
**テーブル:contacts**
|Field|Type|Null|Key|Default|Extra|
|:---|:---|:---|:---|:---|:---|
|contact_id|int| NO|PRI|NULL||
|kind|tinyint(1)|YES||NULL||
|first|varchar(10)|YES||NULL||
|how|varchar(10)|YES||NULL||
|subject|varchar(128)|YES||NULL||
|message|varchar(256)|YES||NULL||



