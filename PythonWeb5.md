# PythonWEB演習5

## カテゴリー別表示機能を考える
商品のページ分けに加えて商品カテゴリーによるページ分けを考えよう。  
**ポイント！**
menuページはページ数とカテゴリー指定と二つのパラメーターを持つことになります。

- ドリンクカテゴリーで2ページ目
- 全てのカテゴリーで3ページ目

など

### ルーティングの変更(クエリパラメータ)

URLの形は`localhost:xxxx/menu?page_no=1&category=all`などとなる

app.py
```python
import .....略.....,request

@app.route('/menu/')
def menu():
    req = request.args
    page_no = req.get('page_no','1')
    category = req.get('category','all')

    return [page_no,category]
```
URLを変更して画面に表示されるページ数とカテゴリーを確認してみましょう。

### メニューデータ(リスト)をカテゴリーで絞り込む

app.py
```python
# カテゴリーの絞り込み
    if category != 'all':
        menus = [menu for menu in menus if menu[1] == category]
```



