
Remember::Application.routes.draw do
  get "internal/index"

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  root to: 'welcome#index'

  #resources :welcome
  get "welcome/index"
  get "welcome/show"
  get "welcome/email_with_sidebar"

  # Cart stuff

  post '/add_to_cart/:product_id'		=> 'carts#add_to_cart',				:as => 'add_to_cart'   #with param PERSON_ID ??

  get '/carts/remove_item'				=> 'carts#remove_item',				:as => 'remove_from_cart'
  get '/carts/present_checkout_view'	=> 'carts#present_checkout_view',	:as => 'present_checkout_view'
  get '/carts/checkout'					=> 'carts#checkout',				:as => 'checkout'
  get '/carts/credit_card_payment'		=> 'carts#credit_card_payment',		:as => 'credit_card_payment'
  get '/carts/paypal_payment'			=> 'carts#paypal_payment',			:as => 'paypal_payment'
  get '/carts/payment_history'			=> 'carts#payment_history'
  get '/carts/store_credit_card'		=> 'carts#store_credit_card'
  get '/carts/show_stored_credit_card'	=> 'carts#show_stored_credit_card'

  get '/payment/execute'				=> 'carts#payment_execute'

  # --------------------------------------------------------------------------------------------------------------------
  # PUBLIC AREA
  # --------------------------------------------------------------------------------------------------------------------
  resources :people do
	  get 'add_story'
  end
  get "/search"				=> 'people#search'

  match '/profile' => 'profile#index'

  devise_for :users,
			 path_names:  {sign_in: "login"},
			 controllers: {omniauth_callbacks: "authentications", registrations: "registrations"}

  match 'facebook' => 'facebook#index'
  get "facebook/send_hello"
  get "facebook/show_fb_friends"

  # --------------------------------------------------------------------------------------------------------------------
  # ADMIN AREA
  # --------------------------------------------------------------------------------------------------------------------
  scope "internal" do

	  get "/" => 'internal#index'

	  resources :stories
	  resources :photos
	  resources :categories
	  resources :products
	  resources :events
	  resources :credit_cards
	  resources :authentications, :only => [:index, :create, :destroy]
	  resources :cart_items
	  resources :carts
  end


end
