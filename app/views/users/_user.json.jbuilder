json.extract! user, :id, :email, :crypted_password, :salt, :firstName, :lastName, :gender, :age, :identificationCardNumber, :phoneNumber, :companyName, :admin, :created_at, :updated_at
json.url user_url(user, format: :json)
