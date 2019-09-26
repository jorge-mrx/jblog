Rails.application.routes.draw do

  root 'welcome#index'

  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'

  

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'welcome/index'
  get 'about/index'
  get 'help/index'
  get 'something/index'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :articles do
  resources :comments
  resources :help
  resources :about
  resources :something

  end
 
  
end