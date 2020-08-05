Rails.application.routes.draw do

  default_url_options :host => "http://192.168.10.16:3000"

  #devise_for :users
  namespace :api do
    namespace :v1 do
      get 'home', to: 'home#index'
      get 'search-attractions' , to: 'home#search_attractions'
      get 'site-areas-by-country-id' , to: 'home#search_area_by_country'
      get 'hotel' , to: 'hotel#index'
      get 'hotel-list' , to: 'hotel#list_by_attraction'

      resources :booking, only: [:create, :index]
      post 'login', to: 'users#login'
     end
  end
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
