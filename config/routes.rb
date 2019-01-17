Rails.application.routes.draw do
  root to:'tasks#index'
  resources :tasks
  
  #ユーザー登録
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :new ,:create]
  
  #ログイン機能
  get 'login', to: 'sessions#new'
  post'login', to: 'sessions#create'
  delete'logout', to:'sessions#destroy'
end