json.extract! car_detail, :id, :user_id, :carRegistrationNumber, :manufacturer, :model, :color, :roadTaxNumber, :created_at, :updated_at
json.url car_detail_url(car_detail, format: :json)
