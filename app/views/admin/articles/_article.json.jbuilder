json.extract! article, :id, :title, :content, :description, :slug, :stylesheet_code, :javascript_code, :created_at, :updated_at
json.url article_url(article, format: :json)
