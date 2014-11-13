class CreateRheemapiwrappers < ActiveRecord::Migration
  def change
    create_table :rheemapiwrappers do |t|
      t.string :contractor_name
      t.string :phone
      t.string :website
      t.string :postalcode
      t.string :email
      t.string :address_one
      t.string :address_two
      t.string :city
      t.string :state
      t.timestamps
    end
  end
end
