# PythonWEB演習4

## menuページを絞り込み

### ページ単位の表示数を固定する
1ページ当たり6件の商品を表示。
溢れた商品を表示するページ機能を追加する。

| ページ数 | 表示される商品番号 | 
| ---- | ---- |  
| 1 | 0-5 |
| 2 | 6-11 |
| 3 | 12-15 |

### ルーティングの変更
app.py
```python
@app.route('/menu/<int:page_no>')
def menu(page_no):

    #動作テスト
    return page_no

    # Menuクラスのインスタンス化
    menu = M.Menu()
    # 以下略
```
templates/base.html
```html
    <li><a href="{{url_for('access')}}">アクセス</a></li>
    <li><a href="{{url_for('menu')}}">メニュー</a></li>
    <li><a href="{{url_for('contact',page_no=1)}}">お問い合わせ</a></li>
```

動作を確認してみましょう。
URLの最後の数字を変えるとどうなるかも試してみましょう。
また数字を省いた場合もどうなるか試してみましょう。

### 表示データの分割

app.py
```python
@app.route('/menu/<int:page_no>')
def menu(page_no):
    
    # Menuクラスのインスタンス化
    menu = M.Menu()
    # CSVを読み出す
    menu.load_csv()
    # メニューデータの取り出し
    menus = menu.get_menu()
    if page_no == 1:
        menus_data = menus[:6]
    # テンプレート(View)にデータを渡す
    return render_template('menu.html',menus=menus_data)
```
### 2ページ目、３ページ目のルーティングを考える

| ページ数 | 表示される商品番号 | リストのスライス
| ---- | ---- | ---- |   
| 1 | 0-5 |　list[:6]
| 2 | 6-11 | list[6:12]
| 3 | 12-15 | list[12:]

app.py
```python
    # 略
    # メニューデータの取り出し
    menus = menu.get_menu()
    if page_no == 1:
        menus_data = menus[:6]
    elif page_no == 2:
        menus_data = menus[6:12]
    elif page_no == 3:
        menus_data = menus[12:]
    # テンプレート(View)にデータを渡す
    return render_template('menu.html',menus=menus_data,page_no=page_no)
```
templates/menu.html
```
{% block main %}
    <!-- メイン -->
    <main>
        <div class="items">
            #略
        </div>
        <p style="text-align: center;">
            <a href="{{url_for('menu',page_no=page_no - 1)}}">前のページ</a> | {{page_no}}/# | <a href="{{url_for('menu',page_no=page_no + 1)}}">次のページ</a>
        </p>
    </main>
    <!-- メインここまで -->
{% endblock %}
```
### 問題点を解決しよう
現状は上手く動くがデータが増えたらその都度手直しが必要になる。  
データ数が変わっても正しく動く仕組みを考えよう。  

page_num が0になったり3以上になるとエラーになる。  
この問題点を解決しましょう。  
例）page_no が1の時には前へページリンクを表示しない  

ヒント：全部で何ページになるかを考えてみましょう。 