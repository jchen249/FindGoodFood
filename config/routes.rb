Rails.application.routes.draw do
  # resources :foods
  resources :restaurants
  get 'dashboard/index'

  get 'welcome/login', :as => :welcome_login

  get '/login', :to => 'sessions#new', :as => 'login'
  get '/rate/:id', :to => 'ratings#new', :as => 'rate'
  post '/rate/:id', :to => 'ratings#create'
  match 'auth/:provider/callback', :to => 'sessions#create', :via => [:get, :post]
  match 'auth/failure', :to => 'sessions#failure', :via => [:get, :post]
  #get 'sessions/destroy', :as => 'logout'
  get 'search' => 'homepage#search'
  get 'results/food' => 'search#food'
  get 'results/restaurant' => 'search#restaurant'
  
  get '/logout', :to => 'sessions#destroy', :as => :logout
  get '/cleanup/', :to => 'sessions#cleanup', :as => :cleanup
  
  resources :users
  
  get '/foods/:id/rate', :to => 'foods#rate', :as => :rate_food
  get '/foods/:id/edit', :to => 'foods#edit', :as => :edit_food
  get '/foods/new', :to => 'foods#new', :as => :new_food
  post '/foods', :to => 'foods#create', :as => :create_food
  put '/foods/:id', :to => 'foods#update', :as => :update_food
  
  # get '/home', :to => 'homepage#home', :as => :home
  # root 'welcome#login'
  root 'homepage#home', :as => :home
end
