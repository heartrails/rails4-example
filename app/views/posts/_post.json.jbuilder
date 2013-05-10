json.(post, :user_id, :text, :url, :created_at, :updated_at)
json.username post.user.username
json.link post_url(post, format: :json)