Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/backend', as: 'rails_admin'
  devise_for :users
  # get '/', controller: 'pages', action: 'home' 以前專案寫法
  root 'candidates#index'    #等於get '/', to: 'candidates#index'
  get '/history', to: 'users#history'
  
  resources :orders, only: [:index, :show, :new, :create]
  resources :products, only: [:index, :show]

  resource :cart, only: [:show, :destroy] do
    collection do
      put :add, path:'add/:id' 
      get :checkout
    end
  end
  
  resources :candidates do
    #member
    member do
      patch :vote
    end
  end
  
  namespace :admin do 
    root "pages#index"
    resources :candidates
  end
  
end
