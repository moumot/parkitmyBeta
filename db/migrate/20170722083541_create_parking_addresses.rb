class CreateParkingAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :parking_addresses do |t|
      t.references :user, foreign_key: true
      t.string :address
      t.string :building
      t.string :city
      t.string :state
      t.string :country
      t.string :postcode
      t.string :additionalDetails
      t.float :monthlyRate
      t.float :weeklyRate
      t.float :dailyRate
      t.float :hourlyRate
      t.float :xCoordinates
      t.float :yCoordinate
      t.boolean :approval
      t.string :features
      t.boolean :status
      t.timestamp :availableFrom

      t.timestamps
    end
  end
end
