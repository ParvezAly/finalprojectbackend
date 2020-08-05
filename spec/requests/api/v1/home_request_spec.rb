require 'rails_helper'

RSpec.describe "Api::V1::Homes", :type => :request do

  #let!(:countries) { create_list(:country, 1) }
  let!(:countries) {
    create(:country, :title => "Pakistan") do |country|
        create(:attraction_area, :country => country, :area_site => "Northern Areas")
        create(:attraction_area, :country => country, :area_site => "Northern Areas")
        create(:attraction_area, :country => country, :area_site => "Northern Areas")
        create(:attraction_area, :country => country, :area_site => "South Areas")
        create(:attraction_area, :country => country, :area_site => "South Areas")
        create(:attraction_area, :country => country, :area_site => "South Areas")
        create(:attraction_area, :country => country, :area_site => "Punjab Areas")
        create(:attraction_area, :country => country, :area_site => "Punjab Areas")
        create(:attraction_area, :country => country, :area_site => "Punjab Areas")
        #create_list(:attraction_area, 3, :country => country)
      end

      create(:country, :title => "USA") do |country|
        create(:attraction_area, :country => country, :area_site => "New York")
        create(:attraction_area, :country => country, :area_site => "New York")
        create(:attraction_area, :country => country, :area_site => "New York")
        #create_list(:attraction_area, 3, :country => country)
      end

      create(:country, :title => "China") do |country|
        create(:attraction_area, :country => country, :area_site => "Goungzhou")
        create(:attraction_area, :country => country, :area_site => "Goungzhou")
        create(:attraction_area, :country => country, :area_site => "Shenzhen")
        create(:attraction_area, :country => country, :area_site => "Yiwu")
        create(:attraction_area, :country => country, :area_site => "Yiwu")
        create(:attraction_area, :country => country, :area_site => "Yiwu")
        #create_list(:attraction_area, 3, :country => country)
      end
  }

  describe 'GET a list of countries and areas' do
    before { get '/api/v1/home.json' }

    it 'returns countries, attraction areas and area site' do
      # Note `json` is a custom helper to parse JSON responses
      expect(response).to have_http_status(200)
      expect(json).not_to be_empty
      expect(json['countries'].size).to eq(3)
      expect(json['country']['id']).to eq(Country.where(:title => "Pakistan").first.id)
    end

  end

  describe 'GET request for search_attractions' do
    let(:country_id) { Country.where(:title => "Pakistan").first.id }
    let(:area_site) { "Northern Areas" }
    before { get "/api/v1/search-attractions.json", :params => { :country_id => country_id, :area_site => area_site } }

    it 'returns searched attractions' do
      # Note `json` is a custom helper to parse JSON responses
      expect(response).to have_http_status(200)
      expect(json).not_to be_empty
      expect(json['attraction_areas'].size).to eq(3)
      expect(json['country']['id']).to eq(country_id)
    end

  end

  describe 'GET search areas by country' do
    let(:country_id) { Country.where(:title => "Pakistan").first.id }
    let(:area_site) { "Northern Areas" }
    before { get "/api/v1/site-areas-by-country-id.json", :params => { :country_id => country_id, :area_site => area_site } }

    it 'returns searched attractions' do
      # Note `json` is a custom helper to parse JSON responses
      expect(response).to have_http_status(200)
      expect(json).not_to be_empty
      expect(json['area_sites'].size).to eq(3)
    end

  end

end
