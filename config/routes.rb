Rails.application.routes.draw do
  root to: 'toppages#index'
  resources :topppages, only: :index
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
