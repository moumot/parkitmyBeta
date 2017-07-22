json.extract! rental_order, :id, :parking_address_id, :user_id, :rentStart, :rentEnd, :orderTotal, :status, :created_at, :updated_at
json.url rental_order_url(rental_order, format: :json)
