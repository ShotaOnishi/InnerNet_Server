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

## 画像アップロード(carrierwave)
(http://hyottokoaloha.hatenablog.com/entry/2016/03/30/234437)
1. アップローダーの作成
  - `rails g uploader PageImage`
2. PageModelにマウントする.
   ```
  class Page < ActiveRecord::Base
    mount_uploader :image, PageImageUploader # mount_uploader カラム名, アップローダー名
    ...
  end
  ```
3. railsの再起動
4. アップロードページの作成(creatと_formの編集)
  (http://ruby-rails.hatenadiary.com/entry/20141015/1413300088)
   ``` {:html}
   #views/pages/_form.html.erb
   <!-- 追加箇所 開始 -->
     <div class="field">
       <% if @page.image? %>
         <div class="thumbnail">
           <%= image_tag @page.image.url %>
         </div>
       <% end %><br>
       <%= f.label :image %><br>
       <%= f.file_field :image %>
       <%= f.hidden_field :image_cache %>
     </div>
     <div class="field">
       <!-- 既存レコード(DBに保存されている)かつ、画像が存在する場合 -->
        <% if @page.persisted? && @page.image? %>
          <label>
            <%= f.check_box :remove_image %>
            画像を削除
          </label>
        <% end %>
     </div>
   <!-- 追加箇所 終了 -->
   ```
5. 画像を見るshow画面の作成.
  既存のpageのshowのimageを書き換える.
  ```
  <p>
    <strong>Image:</strong>
    <% if @page.image? %>
      <div class="thumbnail">
        <%= image_tag @page.image.url %>
      </div>
    <% end %>
  </p>
  ```

## associationの子要素への保存と展開
1. Modelにmigrationをかく
2. Pageモデルにaccepts_nested_attributes_for :tagsをかく
  - コントローラーでstrongパラメータとしてtags_attributesが使えるようになる. (http://qiita.com/hmuronaka/items/818c421dc632e3efb7a6)
3. pageコントローラーのnewアクションに`@page.tags.build`をかく
  - pageの中にtagsという容器ができる.
4. erb側にtagの保存部分をかく
  - `fields_for`でインスタンスの子要素をformに展開
  ```
  <%= f.fields_for :tags do |t| %>
    <%= t.label :name %><br>
    <%= t.text_field :name %>
  <% end %>
  ```

## tagフォームの動的生成
(http://qiita.com/regonn/items/cdbda32900a15721d59b)  
1. gem `nested_form` のインストール
2. formをnested_form仕様に変更. `nested_form(@pages)`
3. nestするformをpartial化してformに組み込む
  * `_tag_fields.html.erb`を作成したのち,
    ```
    <%= f.fields_for :tags do |tag| %>
      <%= render "tag_fields", f: tag %>
    <% end %>
    ```
4. `<%= f.link_to_add "Add Event", :tags %>`で動的生成できるようにする.

## API経由でのcreate
はまった所: pageに紐付いているモデルのデータを挿入できない.
解決策: postのkeyとしてdomainではなく, domain_attributesを使うべきだった. (strong parametersでは_attributesを設定している. )
解決策: ハッシュを渡す必要があったため, rails側でハッシュ形の文字列をevalする.
1. api/v1のコントローラー作成
2. cretateメソッドにて, postパラメータをhashで受け取れるようにする(evalの利用, 後で修正案考えよう)
3. curlでhashを送信して確認 `curl -F 'page[image]=@stake.png' -F 'page[title]=test' -F 'page[is_favorite]=true' -F 'page[memo]=sample_memo' -F 'page[tags_attributes]={"0"=>{"name"=>"fwefwef"}}' -F 'page[domain_attributes]={"0"=>{"name"=>"fwefwef"}, "1"=>{"name"=>"ふぁああああ"}}' http://localhost:3000/api/v1/pages
`

## jbuilderの書き方
JSON形式でデータを返すときは, jbuilderを使うと便利
* jsonの配列で返すとき(index)
  - json.arrayの利用.
    ```
    json.array!(@pages) do |page|
      json.merge! page.attributes
      json.image_url page.image.url
    end
    ```
* jsonを返すとき(show)
  - `json.data @page`
* 返却値をdataで囲うとき
  ```
  json.set! :data do
    ...
  end
  ```

## 検索機能
1. ransackの導入
2. `Tag.search(:name_eq=>'Prolog').result`が可能になる.
3. `Page.ransack(:tags_name_eq=>"Redux").result`とするとPageモデル内からtagsの名前で検索できる
  - searchメソッドは使わないほうが良い. ぶつかる.
  - `Page.search(:tag_name_eq=>"Redux").result`とするとprologの結果が出てきた. why??
4. APIで検索される用のactionを作る. findアクション
5. routesにも反映させる
6. クエリパラメータで複数投げるときは, +　でつなぐ. (例) find/q=hogehoge+fugafuga

## Tagに一意性を持たせる
  1. associationのメソッドを利用する
  2. `pages.tags.new()`でpagesに紐づくtagを生成, `@page.tags << Tag.where(name: tag["name"]).first`で既存のtagにpageを紐付ける.
  3. そのため, 先にtagが存在するかをチェックし, その真偽値で生成か紐づけかを判定`!(Tag.where(name: tag["name"]) == [])`
  4. またnestedparameterは使わないので, `tags_attributes: [:id, :name], domain_attributes: [:id, :name]`をstrongparameterから外す.

## 教訓
* API開発のときは, 先にerb版を作っておいた方が良い.
  - erb版を作って動作することを確かめてから, ctrとviewにapi/v1ディレクトリを作る.
  - どうせerb版は使わないからscaffoldしちゃった方が良い.
* `rails g`ができないとき(scaffoldするときにこの問題にハマった)
  1. `spring stop`
  2. `bin/spring`
  3. `rails g ~~~`
* `PageTag.joins(:tag).select("*").first.attributes`とすれば関連モデルにアクセスできる！
  ```
  極めて単純な解決策としては、以下のscopeを作成してやれば良い。
  scope :joins_get_all_columns, ->(*tables) {
    joins(*tables).select("*")
  }
  ```
* N+1を避けよう
  ```
  Company.includes(:users).references(:users).each {|c| puts c.name; c.users.each{|u| puts u.name} }
  ```
* `!Tag.where(name: tag["name"]) == []`ではなく`!(Tag.where(name: tag["name"]) == [])`

## 疑問
* 親になるモデルがない状態でreferences型のモデルを作るとどうなるのだろうか.
* Webページに対してdomainを持たせる時のassociationはどうすれば良いのか.
