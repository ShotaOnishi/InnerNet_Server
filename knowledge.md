# Knowledge

## gitのcommitメッセージ
fix：バグ修正
add：新規（ファイル）機能追加
update：機能修正（バグではない）
remove：削除（ファイル）

## gitでのtag付け
`git tag -a <タグ名>`で, エディタが表示されメッセージを付けることができる.

## seed-fu
* 初期データを挿入するためのgem
* 使うためにはdb/以下にfixtureディレクトリが必要.
* fixture以下に01_xxx.rbのようなファイルを作る
* `rake db:seed_fu`でseedファイルを作ってくれる.
* associonも作れる. (http://qiita.com/umeyuki@github/items/c86d5d8fc1c99aa241e5)
