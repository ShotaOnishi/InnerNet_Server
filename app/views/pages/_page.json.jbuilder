json.extract! page, :id, :title, :image, :is_favorite, :memo, :url, :created_at, :updated_at
json.url page_url(page, format: :json)