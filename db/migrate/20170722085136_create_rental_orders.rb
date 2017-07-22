class CreateRentalOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :rental_orders do |t|
      t.references :parking_address, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamp :rentStart
      t.timestamp :rentEnd
      t.float :orderTotal
      t.boolean :status

      t.timestamps
    end
  end
end
