Rails.application.routes.draw do
  get 'categories/body_parts'
  get 'categories/car_audio'
  get 'categories/cooling'
  get 'categories/driveline'
  get 'categories/electrical'
  get 'categories/engine'
  get 'categories/filters'
  get 'categories/fuel_ignition'
  get 'categories/steering'
  get 'categories/suspension'
  get 'search', to: "listings#search"
  resources :payments
  get 'orders/success', to: 'orders#success'
  get 'orders/bought'
  get 'orders/sold'
  get "/payments/success", to: "payments#success"
  resources :listings
  devise_for :users
  root 'pages#home'
  post "listings/:id/order", to: "listings#place_order", as: "place_order"
  post "/payments/webhook", to: "payments#webhook"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
