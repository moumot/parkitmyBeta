class ParkingAddress < ApplicationRecord
 	has_many :RentalOrder, :dependent => :destroy
 	belongs_to :user

	def self.find_by_userid(userid)
		ParkingAddress.where("user_id = ?", userid)
	end

	def self.parkingaddress_id(id)
  		ParkingAddress.where("id = ?", id)
  	end

  	def self.bookingsMadeAmount(userid)
  		ParkingAddress.where("user_id = ?", userid).count
  	end

  	def self.bookingsReceivedAmount(parkingaddressid)
  		ParkingAddress.where("parking_addresses_id = ?", parkingaddressid).count
  	end

	def self.parkingApproval(parkingaddressid)
		ParkingAddress.where("id = ?", parkingaddressid).update_all(approval: true)
	end


	def self.geolocation1(parkingaddressid)
		query = ParkingAddress.find_by("id = ?", parkingaddressid)
		
		address = query.address.to_s.gsub(/\s+/, "")
		city = query.city.to_s.gsub(/\s+/, "")
		state = query.state.to_s.gsub(/\s+/, "")
		country = query.country.to_s.gsub(/\s+/, "")
		zipcode = query.zipcode.to_s.gsub(/\s+/, "")

		googlequery = "http://maps.google.com/maps/api/geocode/json?address="
		googlequery = googlequery + "#{query.address}+#{query.city}+#{query.state}+#{query.country}+#{query.zipcode}"
		result = JSON.parse(open(googlequery).read)

		latitude = result['results'][0]['geometry']['location']['lat']
		longitude = result['results'][0]['geometry']['location']['lng']
		
		ParkingAddress.where("id = ?", parkingaddressid).update_all(yCoordinate: latitude, xCoordinate: longitude)
		return result
	end

	def self.geolocation(parkingaddressid)
		query = ParkingAddress.find_by("id = ?", parkingaddressid)
		
		address = query.address.to_s.gsub(/\s+/, "")
		city = query.city.to_s.gsub(/\s+/, "")
		state = query.state.to_s.gsub(/\s+/, "")
		country = query.country.to_s.gsub(/\s+/, "")
		zipcode = query.zipcode.to_s.gsub(/\s+/, "")

		googlequery = "http://maps.google.com/maps/api/geocode/json?address="
		googlequery = googlequery + "#{query.address}+#{query.city}+#{query.state}+#{query.country}+#{query.zipcode}"
		result = JSON.parse(open(googlequery).read)

		latitude = result['results'][0]['geometry']['location']['lat']
		longitude = result['results'][0]['geometry']['location']['lng']
		
		ParkingAddress.where("id = ?", parkingaddressid).update_all(yCoordinate: latitude, xCoordinate: longitude)
		return result
	end

	def self.minimummaximumcoordinate(xminCoordinate,xmaxCoordinate,yminCoordinate,ymaxCoordinate)
		ParkingAddress.where("xCoordinate <= ?", xmaxCoordinate).where("xCoordinate >= ?", xminCoordinate).where("yCoordinate <= ?", ymaxCoordinate).where("yCoordinate >= ?", yminCoordinate).where("approval = ?", true)
	end

	def self.amountOfParking(userid)
	ParkingAddress.where("user_id = ?", userid).count
	end
end
