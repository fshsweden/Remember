
Remember::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  root to: 'welcome#index'

  #resources :welcome
  get "welcome/index"
  get "welcome/show"
  get "welcome/email_with_sidebar"

  get "people/search"
  get "people/search_with_param"

  # Cart stuff
  post '/add_to_cart/:product_id' => 'carts#add_to_cart', :as => 'add_to_cart'   #with param PERSON_ID ??
  get '/carts/remove_item' => 'carts#remove_item', :as => 'remove_from_cart'
  get '/carts/present_checkout_view' => 'carts#present_checkout_view', :as => 'present_checkout_view'
  get '/carts/checkout' => 'carts#checkout', :as => 'checkout'
  get '/carts/credit_card_payment' => 'carts#credit_card_payment', :as => 'credit_card_payment'
  get '/carts/paypal_payment' => 'carts#paypal_payment', :as => 'paypal_payment'
  get '/carts/payment_history' => 'carts#payment_history'

  get '/carts/store_credit_card' => 'carts#store_credit_card'
  get '/carts/show_stored_credit_card' => 'carts#show_stored_credit_card'

  get '/payment/execute' => 'carts#payment_execute'

  resources :people do
	  get 'add_story'
  end
  resources :stories
  resources :photos
  resources :categories
  resources :products
  resources :events
  resources :cards
  resources :authentications, :only => [:index, :create, :destroy]
  resources :cart_items
  resources :carts

  #get "profile/index"                # no profile_path created?
  match '/profile' => 'profile#index'

  devise_for :users,
             path_names:  {sign_in: "login"},
             controllers: {omniauth_callbacks: "authentications", registrations: "registrations"}

  match 'facebook' => 'facebook#index'

  get "facebook/send_hello"
  get "facebook/show_fb_friends"

end

# The priority is based upon order of creation:
# first created -> highest priority.

# Sample of regular route:
#   match 'products/:id' => 'catalog#view'
# Keep in mind you can assign values other than :controller and :action

# Sample of named route:
#   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
# This route can be invoked with purchase_url(:id => product.id)

# Sample resource route (maps HTTP verbs to controller actions automatically):
#   resources :products

# Sample resource route with options:
#   resources :products do
#     member do
#       get 'short'
#       post 'toggle'
#     end
#
#     collection do
#       get 'sold'
#     end
#   end

# Sample resource route with sub-resources:
#   resources :products do
#     resources :comments, :sales
#     resource :seller
#   end

# Sample resource route with more complex sub-resources
#   resources :products do
#     resources :comments
#     resources :sales do
#       get 'recent', :on => :collection
#     end
#   end

# Sample resource route within a namespace:
#   namespace :admin do
#     # Directs /admin/products/* to Admin::ProductsController
#     # (app/controllers/admin/products_controller.rb)
#     resources :products
#   end

# You can have the root of your site routed with "root"
# just remember to delete public/old_index.html.
# root :to => 'welcome#index'

# See how all your routes lay out with "rake routes"

# This is a legacy wild controller route that's not recommended for RESTful applications.
# Note: This route will make all actions in every controller accessible via GET requests.
# match ':controller(/:action(/:id))(.:format)'
