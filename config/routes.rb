Rails.application.routes.draw do
  get 'welcome/index'
  get 'about/index'
  get 'help/index'
  get 'something/index'
 
    resources :articles do
    resources :comments
    resources :help
    resources :about
    resources :something
  end
 
  root 'welcome#index'
end