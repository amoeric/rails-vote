Rails.application.routes.draw do
  devise_for :users
  # get '/', controller: 'pages', action: 'home' 以前專案寫法
  root 'candidates#index'    #等於get '/', to: 'candidates#index'
  resources :candidates do
    #member
    member do
      patch :vote
    end
  end
  # patch "/candidates/:id/vote", to: "candidates#vote"

end
