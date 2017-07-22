class User < ApplicationRecord
  has_many :CarDetail, :dependent => :destroy
  has_many :ParkingAddress, :dependent => :destroy
  authenticates_with_sorcery!
  validates_uniqueness_of :indentificationCardNumber, :allow_blank => true, :allow_nil => true
  validates_uniqueness_of :driverLicense, :allow_blank => true, :allow_nil => true
  validates :email, uniqueness: true, presence: true
  validates :gender, presence: true
	
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  def self.user_id(id)
  		User.find_by("id = ?", id)
  end

  def self.user_admin(id)
  		user = User.find_by("id = ?", id)
  		User.where("id = ?", user.id).update_all(admin: true)
  end # need testing

  
end
