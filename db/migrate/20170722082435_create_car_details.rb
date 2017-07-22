class CreateCarDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :car_details do |t|
      t.references :user, foreign_key: true
      t.string :carRegistrationNumber
      t.string :manufacturer
      t.string :model
      t.string :color
      t.string :roadTaxNumber

      t.timestamps
    end
  end
end
