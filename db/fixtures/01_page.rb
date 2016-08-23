Page.seed do |s|
  s.id = 1
  s.title = "Angular vs RIOT"
  s.image = "https://d1xt3jet61y36q.cloudfrontex.net/package/file/parts/7479/9ec00fb403de2f2674a1312ad72058e7"
  s.is_favorite = false
  s.memo = "Fucking Article"
  s.url = "hogehoge.com"
end

Page.seed do |s|
  s.id = 2
  s.title = "RIOT vs Vue"
  s.image = "http://www.marquee-mag.com/blog/entryimg/_P5A2549.jpg"
  s.is_favorite = true
  s.memo = "しゅごい記事〜〜〜"
  s.url = "hogehoge.com"
end

Page.seed do |s|
  s.id = 3
  s.title = "これはサンプルです"
  s.image = "http://img.laughy.jp/17282/default_a2c489c93ce4123d726ed54b6ff14ab9.jpg"
  s.is_favorite = true
  s.memo = "サンプルってんだろがああああああああああああ"
  s.url = "hogehoge.com"
end
