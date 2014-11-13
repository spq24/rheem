class PostcodesController < ApplicationController

	def create
	end

  def postcode_params
    params.require(:postcode).permit(:zip, :zip_type, :primary_city, :state, :county, :timezone, :area_code, :latitude, :longitude)
  end
end