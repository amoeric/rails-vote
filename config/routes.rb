Rails.application.routes.draw do
  devise_for :users
  # get '/', controller: 'pages', action: 'home' 以前專案寫法
  root 'candidates#index'    #等於get '/', to: 'candidates#index'
  get '/history', to: 'users#history'
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
