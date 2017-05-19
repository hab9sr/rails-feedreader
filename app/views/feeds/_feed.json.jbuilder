json.extract! feed, :id, :category_id, :title, :author, :link, :created_at, :updated_at
json.url feed_url(feed, format: :json)
