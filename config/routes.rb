Blocitoff::Application.routes.draw do

  resources :lists

  devise_for :users
  
  resources :todos, only: [:new]

  get 'about' => 'welcome#about'
  
  root to: 'welcome#index'

end
