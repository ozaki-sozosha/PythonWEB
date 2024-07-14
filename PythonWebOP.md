# Python Web 補足

## 画面遷移
ユーザーが一つの画面（UI要素やページ）から別の画面へ移動するプロセス。  
Webアプリケーションでは下記の動作を使い分けます。
- アンカータグ(Aタグ)をクリックすることにより、WebサーバーにHTTPリクエストを送信し、HTTPレスポンスを受けることで画面を更新する。
- リダイレクト。HTTPリクエスト先を変更して転送を行います。 HTTPリクエスト&レスポンスが2回実行されます。

### アンカータグによる画面遷移
一般的なAタグによる遷移
```html
<li><a href="/">ホーム</a></li>
```
`url_for関数`による遷移
```html
<li><a href="{{url_for('index')}}">ホーム</a></li>
```

### リダイレクトによる画面遷移
Python
Flaskにて"/redirect"にアクセスするとトップページにリダイレクト
```python
from flask import Flask,...略...,redirect

@app.route('/redirect')
def redirect():
    return redirect('/')
    # url_forを利用した場合
    # return redirect(url_for('index'))
```

HTMLにアンカータグを記述します。
```html
<li><a href="{{url_for('redirect')}}">リダイレクト(実験)</a></li>
```


Chromeのデベロッパーツールでリダイレクトの動作を確認してみましょう。