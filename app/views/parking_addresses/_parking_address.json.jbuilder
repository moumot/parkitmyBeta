json.extract! parking_address, :id, :user_id, :address, :building, :city, :state, :country, :postcode, :additionalDetails, :monthlyRate, :weeklyRate, :dailyRate, :hourlyRate, :xCoordinates, :yCoordinate, :approval, :features, :status, :availableFrom, :created_at, :updated_at
json.url parking_address_url(parking_address, format: :json)
