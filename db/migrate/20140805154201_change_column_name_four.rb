class ChangeColumnNameFour < ActiveRecord::Migration
  def change
  	rename_column :contractors, :OrganizationName, :organizationname
  end
end
