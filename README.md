# InnerNet_Server

## 起動まで

ruby 2.2.3とrailsを使います.
```
rbenv version
=> 2.2.3

bundle install

rake db:migrate

rake db:seed-fu

bundle exec rails s
```

## API


```
pages#index  
GET /api/v1/pages  
{"data":[{"id":1,"title":"Angular vs RIOT","image":null,"is_favorite":false,"memo":"Fucking Article","url":"hogehoge.com","created_at":"2016-08-23T08:24:16.463Z","updated_at":"2016-08-23T08:24:16.463Z","image_url":null,"tag":["Angular","RIOT"],"domain":{"id":1,"name":"Qiita","created_at":"2016-08-23T08:24:16.507Z","updated_at":"2016-08-23T08:24:16.507Z"}},{"id":2,"title":"RIOT vs Vue","image":null,"is_favorite":true,"memo":"しゅごい記事〜〜","url":"hogehoge.com","created_at":"2016-08-23T08:24:16.470Z","updated_at":"2016-08-23T08:24:16.470Z","image_url":null,"tag":["RIOT"],"domain":{"id":2,"name":"Hatena","created_at":"2016-08-23T08:24:16.510Z","updated_at":"2016-08-23T08:24:16.510Z"}}...]}  

pages#find
GET /api/v1/pages/find?q=Elixir
{"data":[{"id":41,"title":"リアルタイムウェブな観点からElixir / Phoenix について - Qiita","image":"6239d3bf-ba22-4b9d-a188-3a57a30119fcpage.png","is_favorite":null,"memo":"","url":null,"created_at":"2016-08-27T14:33:51.215Z","updated_at":"2016-08-27T14:33:51.215Z","image_url":"/uploads/page/image/41/6239d3bf-ba22-4b9d-a188-3a57a30119fcpage.png","tag":["Elixir","Phonix"],"domain":{"id":5,"name":"あとでdomain送るお","created_at":"2016-08-24T16:49:54.735Z","updated_at":"2016-08-24T16:49:54.735Z"}},{"id":42,"title":"Phoenix","image":"ccc95806-4b44-424b-9e97-2ae25d5f46c1page.png","is_favorite":null,"memo":"","url":null,"created_at":"2016-08-27T14:33:56.757Z","updated_at":"2016-08-27T14:33:56.757Z","image_url":"/uploads/page/image/42/ccc95806-4b44-424b-9e97-2ae25d5f46c1page.png","tag":["Elixir","Phonix"],"domain":{"id":5,"name":"あとでdomain送るお","created_at":"2016-08-24T16:49:54.735Z","updated_at":"2016-08-24T16:49:54.735Z"}}]}


pages#show  
GET /api/v1/pages/1  
{"data":{"id":80,"title":"Common Lisp 入門","image":{"url":"/uploads/page/image/80/2fba99fb-9e3f-4d6d-83f7-8aa5c0177694page.png"},"is_favorite":null,"memo":"","url":"http://www.geocities.jp/m_hiroi/xyzzy_lisp/abclisp01.html","created_at":"2016-08-27T14:47:49.997Z","updated_at":"2016-08-27T14:47:49.997Z"}}  

pages#create  
POST /api/v1/pages  
crawler側からpostするcurlが発行される.
どういうcurlされるかは後で気分が乗れば書く説
```
