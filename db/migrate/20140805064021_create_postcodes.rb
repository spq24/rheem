class CreatePostcodes < ActiveRecord::Migration
  def change
    create_table :postcodes do |t|
      t.string :postalcode
      t.string :type
      t.string :primary_city
      t.string :state
      t.string :county
      t.string :timezone
      t.string :area_code
      t.string :latitude
      t.string :longitude
      t.string :estimated_population
      t.timestamps
    end
  end
end
