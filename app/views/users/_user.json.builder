json.extract! user, :id, :username, :email, :isAdmin, :created_at, :updated_at
json.url user_url(user, format: :json)
