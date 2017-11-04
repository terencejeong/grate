json.extract! item, :id, :user_id, :description, :price, :image_data, :created_at, :updated_at
json.url item_url(item, format: :json)
