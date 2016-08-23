json.set! :data do
  json.array!(@pages) do |page|
    json.merge! page.attributes
    json.image_url page.image.url
    json.set! :tag do
      json.array!(page.tags) do |tag|
        json.merge! tag.name
      end
    end
      json.domain page.domain.name
  end
end
