class RemoteContractor
	include HTTParty
	format :json
	base_uri 'https://io.myrheem.com/v1/contractors'

	attr_accessor :contractor_name, :phone, :website, :postalcode, :email, :address_one, :address_two, :city, :state

	def initialize(contractor_name, phone, website, postalcode, email, address_one, address_two, city, state)
		self.OrganizationName = contractor_name
		self.Phone = phone
		self.WebSite = website
		self.postalcode = postalcode
		self.CorporateEmail = email
		self.AddressLine1 = address_one
		self.AddressLine2 = address_two
		self.State = state
	end

	def self.find(postalcode)
		response = get('/getcontractorsbyzipandradius?PostalCode=#{postalcode}&Radius=100&bHeatCool=true&bWHRes=false&bWHComm=false&bWHTankless=false&bSolarWH=false&bHomeGen=false&bPoolSpa=false&bDesignStar=false&bKwikComfort=false&bPPlus=false&bCashback=false&bTC=false&bASP=false&bRheem=true&bRuud=false&bPHCC=false')
		if response.success?
			self.new(response["OrganizationName"])
		else
			raise response.response
		end
	end
end
