class ChangeContractorColumn < ActiveRecord::Migration
  def change
  	rename_column :contractors, :contractor_name, :OrganizationName
  end
end
