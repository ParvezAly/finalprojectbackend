class Api::V1::HomeController < Api::V1::BaseController
  skip_before_action :require_login
  #skip_before_action :verify_authenticity_token
  #This API will call to get default data for home page
  def index
    #Get All country list from DB
    @countries = Country.all
    #set the country to pakistan by default
    @country = Country.find_by(:title => 'Pakistan')
    #set the search area to Northern Areas
    @area_site = "Northern Areas"
    #Get Alt the areas on the basis of country and area site
    @attraction_areas = @country.attraction_areas.where(:area_site =>  @area_site)
    @area_sites = @country.attraction_areas.select(:area_site).group(:area_site)
  end

  #This API will call to get search data for Area Site and Country
  def search_attractions
    #set the country on the basis of user sleect from the front End
    @country = Country.find_by(:id => params[:country_id])
    #Get Alt the areas on the basis of country and area site
    @area_site = params[:area_site]
    @attraction_areas = @country.attraction_areas.where(:area_site => params[:area_site])
  end


  def search_area_by_country
    #set the country on the basis of user sleect from the front End
    @country = Country.find_by(:id => params[:country_id])
    @area_site = params[:area_site]
    #Get Alt the areas on the basis of country and area site
    @area_sites = @country.attraction_areas.select(:area_site).group(:area_site)
  end


end