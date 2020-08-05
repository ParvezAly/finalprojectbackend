require 'rails_helper'

RSpec.describe "Api::V1::Hotel", :type => :request do

  #let!(:countries) { create_list(:country, 1) }
  let!(:countries) {
    create(:country, :title => "Pakistan") do |country|
        create(:attraction_area, :country => country, :area_site => "Northern Areas", :title => "Hunza")
        create(:attraction_area, :country => country, :area_site => "Northern Areas", :title => "Hunza")
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

  describe 'GET a list of hotels' do
    before { get '/api/v1/hotel.json' }

    it 'returns list of hotels' do
      # Note `json` is a custom helper to parse JSON responses
      expect(response).to have_http_status(200)
      expect(json).not_to be_empty
      expect(json['hotels'].size).to eq(5)
    end

  end

  describe 'GET a list of hotels by attraction' do
    let(:attraction_area_id) { AttractionArea.find_by(:title => 'Hunza').id }
    before { get "/api/v1/hotel-list.json", :params => { :attraction_area_id => attraction_area_id } }

    it 'returns searched hotels' do
      # Note `json` is a custom helper to parse JSON responses
      expect(response).to have_http_status(200)
      expect(json).not_to be_empty
      expect(json['hotels'].size).to eq(5)
    end

  end

end
