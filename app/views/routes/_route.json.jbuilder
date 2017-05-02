json.extract! route, :id, :name, :city_id, :description, :price, :created_at, :updated_at
json.url route_url(route, format: :json)
