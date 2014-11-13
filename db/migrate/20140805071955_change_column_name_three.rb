class ChangeColumnNameThree < ActiveRecord::Migration
  def change
  	rename_column :postcodes, :type, :zip_type
  end
end
