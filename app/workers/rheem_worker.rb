class RheemWorker
  include Sidekiq::Worker

  def perform
	Postcode.all.find_each do |p|
	response = HTTParty.get("https://io.myrheem.com/v1/public/contractors/getcontractorsbyzipandradius?PostalCode=#{p.zip}&Radius=100&bHeatCool=true&bWHRes=false&bWHComm=false&bWHTankless=false&bSolarWH=false&bHomeGen=false&bPoolSpa=false&bDesignStar=false&bKwikComfort=false&bPPlus=false&bCashback=false&bTC=false&bASP=false&bRheem=true&bRuud=false&bPHCC=false").to_json
	contractors = JSON.parse(response)["Contractors"]
		contractors.to_a.each do |c|
		 contractorname = c["OrganizationName"]
		 if Contractor.exists?(organizationname: contractorname)
		 	next
		 else
		 	Contractor.create(:organizationname => c["OrganizationName"], :phone => c["Phone"], :website => c["WebSite"], :postalcode => c["postalcode"], :email => c["CorporateEmail"], :address_one => c["AddressLine1"], :address_two => c["AddressLine2"], :city => c["City"], :state => c["State"])
		 end
		end
	end
  end
end