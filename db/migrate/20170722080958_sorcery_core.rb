class SorceryCore < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email,            :null => false
      t.string :crypted_password
      t.string :salt
      t.string :firstName
      t.string :lastName
      t.string :gender
      t.integer :age
      t.string :identificationCardNumber
      t.string :phoneNumber
      t.string :companyName
      t.string :admin

      t.timestamps                :null => false
    end

    add_index :users, :email, unique: true
  end
end
