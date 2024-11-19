json.extract! menu, :id, :item, :description, :price, :available, :owner_id, :created_at, :updated_at
json.url menu_url(menu, format: :json)
