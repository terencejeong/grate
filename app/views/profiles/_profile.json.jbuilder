json.extract! profile, :id, :avatar_data, :about_me, :first_name, :last_name, :username, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
