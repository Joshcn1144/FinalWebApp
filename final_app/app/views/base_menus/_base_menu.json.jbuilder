json.extract! base_menu, :id, :title, :description, :owner_id, :created_at, :updated_at
json.url base_menu_url(base_menu, format: :json)
