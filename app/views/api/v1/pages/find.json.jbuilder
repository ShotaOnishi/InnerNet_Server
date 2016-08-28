json.set! :data do
  json.array!(@pages) do |page|
    json.merge! page.attributes
    json.image_url page.image.url
    json.set! :tag do
      json.array!(page.tags) do |tag|
        json.merge! tag.name
      end
    end
    # page.domainはcollection型, だからfirstがないとcollectionのmethodのnameを
    # 呼び出し, 常に"Domain"が返るようになる.
    # ん? page.domain.first.nameが使えないだと...
    json.domain page.domain.first
  end
end
