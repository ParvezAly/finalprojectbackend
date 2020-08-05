require 'rails_helper'

RSpec.describe "Api::V1::Booking", :type => :request do

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

  describe 'POST create a booking with new user' do

    before { post '/api/v1/booking.json', :params => { :booking => {
          :booking_type => 1/2,
          :check_in_date => Time.now.to_date + 5.days,
          :check_out_date => Time.now.to_date + 7.days,
          :num_of_adults => 1,
          :num_of_children => 1,
          :hotel_id => Hotel.first.id,
          :email => "parvez@gmail.com",
          :name => "Parvez",
          :addtional_instructions => "additional instructions"
        } } }

    it 'returns a new user with booking' do
      # Note `json` is a custom helper to parse JSON responses
      expect(response).to have_http_status(200)
      expect(json).not_to be_empty
      expect(json['success']).to eq true
    end

  end

end
