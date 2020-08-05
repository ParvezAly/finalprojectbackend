class Api::V1::HotelController < Api::V1::BaseController
  skip_before_action :require_login
  #This API will get the default hotel data for booking page
  def index
    #Set the area by default
    attraction_area = AttractionArea.find_by(:title => 'Hunza')
    #Get all the hotels on the basis of default area
    @hotels = attraction_area.hotels
  end

  #This API will get the hotel data on the basis of selected attraction area
  def list_by_attraction
    #Set the area on the basis of user selection
    attraction_area = AttractionArea.find_by(:id => params[:attraction_area_id])
    #Get all the hotels on the basis of area that will user select
    @hotels = attraction_area.hotels
  end

end