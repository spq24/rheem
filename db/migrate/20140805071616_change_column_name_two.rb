class ChangeColumnNameTwo < ActiveRecord::Migration
  def change
  	rename_column :postcodes, :postalcode, :zip
  end
end

