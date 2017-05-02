json.extract! excursion, :id, :city_id, :name, :description, :price, :created_at, :updated_at
json.url excursion_url(excursion, format: :json)
