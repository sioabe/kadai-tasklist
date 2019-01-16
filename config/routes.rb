Rails.application.routes.draw do
  get 'toppage',to: 'tasks#index'
  root to:'users#index'
  resources :tasks
  
  #ユーザー登録
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
  
  #ログイン機能
  get 'login', to: 'sessions#new'
  post'login', to: 'sessions#create'
  delete'logout', to:'sessions#destroy'
end