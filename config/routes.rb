Rails.application.routes.draw do

  get 'page/home'

  get 'page/search'

  get 'page/signup'

  get 'page/howitworks'

  get 'page/dlanding'

  get 'page/olanding'

  get 'page/dmanage'

  get 'page/omanage'

  get 'page/profile'

  get 'page/help'

  get 'page/contact'

  get 'page/leasing'

  get 'page/bookingdetails'

  get 'page/aboutus'

  get 'page/faq'

  get 'page/blog'

  get 'page/success1'

  get 'page/success2'

  get 'page/success3'

  get 'page/success4'

  get 'page/tnc'

  resources :rental_orders
  resources :parking_addresses
  resources :car_details
  root :to => 'users#index'
  resources :user_sessions
  resources :users

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
  get 'user_sessions/new'

  get 'user_sessions/create'

  get 'user_sessions/destroy'

  resources :users

  # define "/users_get" as a route that is handled by the users_controller function users_get
  get "users_get" => "users#users_get"

  # define "/users_post" as a POST route that is handled by the users_controller function users_post
  post "users_post", to: "users#users_post"

  # define "/rental_orders_get" as a route that is handled by the rental_orders_controller function rental_orders_get
  get "rental_orders_get" => "rental_orders#rental_orders_get"

  # define "/rental_orders_post" as a POST route that is handled by the rental_orders_controller function rental_orders_post
  post "rental_orders_post", to: "rental_orders#rental_orders_post"

  # define "/car_details_get" as a route that is handled by the car_details_controller function car_details_get
  get "car_details_get" => "car_details#car_details_get"

  # define "/car_details_post" as a POST route that is handled by the car_details_controller function car_details_post
  post "car_details_post", to: "car_details#car_details_post"

  # define "/parking_addresses_get" as a route that is handled by the parking_addresses_controller function parking_addresses_get
  get "parking_addresses_get" => "parking_addresses#parking_addresses_get"

  # define "/parking_addresses_post" as a POST route that is handled by the parking_addresses_controller function parking_addresses_post
  post "parking_addresses_post", to: "parking_addresses#parking_addresses_post"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
