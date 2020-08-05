require 'rails_helper'

RSpec.describe "Api::V1::User", :type => :request do

  let!(:user) { create(:user) }

  describe 'POST Login user successfully' do

    before { post '/api/v1/login.json', :params => { :email => user.email, :password => user.password } }

    it 'returns a auth token and user information' do
      # Note `json` is a custom helper to parse JSON responses
      expect(response).to have_http_status(200)
      expect(json).not_to be_empty
      expect(json['success']).to eq true
      expect(json['email']).to eq user.email
    end

  end

  describe 'POST Login user failed without password and email' do

    before { post '/api/v1/login.json' }

    it 'returns errors' do
      # Note `json` is a custom helper to parse JSON responses
      expect(response).to have_http_status(200)
      expect(json).not_to be_empty
      expect(json['success']).to eq false
      expect(json['message']).to eq "Log in failed! Username or password invalid!"
    end

  end

  describe 'POST Login user failed without password' do

    before { post '/api/v1/login.json', :params => { :email => user.email } }

    it 'returns errors' do
      # Note `json` is a custom helper to parse JSON responses
      expect(response).to have_http_status(200)
      expect(json).not_to be_empty
      expect(json['success']).to eq false
      expect(json['message']).to eq "Log in failed! Username or password invalid!"
    end

  end

  describe 'POST Login user failed with wrong email and password' do

    before { post '/api/v1/login.json', :params => { :email => "test@test.com", :password => "123" } }

    it 'returns errors' do
      # Note `json` is a custom helper to parse JSON responses
      expect(response).to have_http_status(200)
      expect(json).not_to be_empty
      expect(json['success']).to eq false
      expect(json['message']).to eq "Log in failed! Username or password invalid!"
    end

  end

end
