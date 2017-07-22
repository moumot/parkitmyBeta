class CarDetail < ApplicationRecord
  belongs_to :user
  has_many :RentalOrder, :dependent => :destroy
  validates :carRegistrationNumber, uniqueness: true
  validates  :roadTaxNumber, uniqueness: true

  def self.find_by_userid(userid)
		CarDetail.where("user_id = ?", userid)
  end

  def self.cardetail_id(id)
  		CarDetail.where("id = ?", id)
  end
end
