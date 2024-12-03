json.extract! menu_item, :id, :item, :description, :price, :available, :base_menu_id, :created_at, :updated_at
json.url menu_item_url(menu_item, format: :json)
