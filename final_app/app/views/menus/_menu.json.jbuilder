json.extract! menu, :id, :name, :description, :price, :available, :user_id, :created_at, :updated_at
json.url menu_url(menu, format: :json)
