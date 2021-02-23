json.extract! v2_user, :id, :name, :email, :age, :password, :created_at, :updated_at
json.url v2_user_url(v2_user, format: :json)
