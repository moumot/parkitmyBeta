class RentalOrder < ApplicationRecord
  belongs_to :ParkingAddress
  belongs_to :user

  def self.find_by_userid(userid)
	RentalOrder.where("user_id = ?", userid)#.find_by_parkinguserid(userid)
  end

  def self.find_by_parkinguserid(userid)
  	ParkingAddress.where("user_id = ?", userid)
  end

  def self.currentrentalMade(rentalid)
  	RentalOrder.where("user_id = ?", rentalid).where("rentStart >= ?", Time.now).where("rentEnd <= ?", Time.now)
  end

  def self.currentrentalReceived(rentalReceivedid)
  	RentalOrder.where("ParkingAddress_id = ?", rentalReceivedid).where("rentStart >= ?", Time.now).where("rentEnd <= ?", Time.now)
  end

  def self.rentalorder_id(id)
  	RentalOrder.find_by("id = ?", id)
  end

  def self.bookingsMadeAmount(userid)
  	RentalOrder.where("user_id = ?", userid).count
  end

  def self.bookingsReceivedAmount(userid)
  	i = 0
  	user = find_by_parkinguserid(userid)
  	amount = 0
	while i < user.size do
		value = RentalOrder.where("ParkingAddress_id = ?", user[i].id).count
  		amount = value + amount
  		i += 1
  	end
  	return amount
  end

  def self.find_rentedparking(userid)
  	i = 0
  	user = find_by_parkinguserid(userid)
  	rent = []
	while i < user.size do
  		rent.push RentalOrder.where("ParkingAddress_id = ?", user[i].id)
  		i += 1
  	end
  	return rent
  end

  def self.rentalTotal(rentalid)
  	rent = rentalorder_id(rentalid)

  	rentTotalHour = (rent.rentEnd.to_i - rent.rentStart.to_i)
  	rentmodulus = rentTotalHour % 3600
    rentPA = ParkingAddress.find_by("id = ?", rent.ParkingAddress_id)

  	rentTotalHourly = rent.rentEnd.hour - rent.rentStart.hour
  	rentTotalWeekly = (rent.rentEnd.day - rent.rentStart.day) / 7
  	rentTotalDaily = (rent.rentEnd.day - rent.rentStart.day) - (7 * rentTotalWeekly)
  	rentTotalMonthly = ((rent.rentEnd.year * 12 + rent.rentEnd.month) - (rent.rentStart.year * 12 + rent.rentStart.month))
  	rentTotalYearly = rent.rentEnd.year - rent.rentStart.year

  	if rentTotalHour > 0 && rentTotalHour < 3600
  		rentTotal = rentPA.hourlyRate
  	else 
		rentTotal = (rentTotalYearly * rentPA.montlyRate * 12) +  (rentTotalMonthly * rentPA.montlyRate) + (rentTotalWeekly * rentPA.weeklyRate) + (rentTotalDaily * rentPA.dailyRate) + (rentTotalHourly * rentPA.hourlyRate)
		if rentmodulus != 0
			rentTotal = rentTotal + rentPA.hourlyRate
		end
  	end
  	RentalOrder.where("id = ?", rentalid).update_all(orderTotal: rentTotal)
  end

  def self.latestparking(rentalid)
    rent = RentalOrder.where("rentStart >= ?", Time.now).where("user_id = ?", rentalid).order("rentStart").first
    if rent.nil?
      rent = {rental_order: {id: "0",ParkingAddress: {id: "0",address: "0",city: "0",state: "0",country: "0",zipcode: "0",additionalDetails: "0",montlyRate: "0",weeklyRate: "0",dailyRate: "0",hourlyRate: "0",xCoordinate: "0",yCoordinate: "0",approval: "0",user: {id: "0",email: "0",firstName: "0",lastName: "0",gender: "0",age: "0",indentificationCardNumber: "0",driverLicense: "0"}},user: {id: "0",email: "0",firstName: "0",lastName: "0",gender: "0",age: "0",indentificationCardNumber: "0",driverLicense: "0"},rentStart: "0",rentEnd: "0",orderTotal: "0",orderStatus: "0"}}
      return rent.to_json
    else
      return rent
    end
  end

  def self.updateuserid(userid)
    latestRent = RentalOrder.order("id").last
    puts "Latest Rent ID: " + latestRent.id.to_s
    final = RentalOrder.where("id = ?", latestRent.id).update_all(user_id: userid)
    return final
  end
end
