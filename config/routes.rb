Rails.application.routes.draw do
  # get '/', controller: 'pages', action: 'home' 以前專案寫法
  root 'candidates#index'    #等於get '/', to: 'candidates#index'
  resources :candidates     #新增 讀取 更新 刪除 CRUD
end
