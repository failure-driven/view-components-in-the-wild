json.extract! v3_user, :id, :name, :email, :age, :password, :created_at, :updated_at
json.url v3_user_url(v3_user, format: :json)
