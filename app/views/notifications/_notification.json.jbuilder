json.extract! notification, :id, :title, :content, :type_to, :user_id, :created_at, :updated_at
json.url notification_url(notification, format: :json)
