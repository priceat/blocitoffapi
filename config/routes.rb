Blocitoff::Application.routes.draw do

  devise_for :users
  resources :lists
  resources :tasks

  
  
  resources :todos, only: [:new]

  get 'about' => 'welcome#about'
  
  root to: 'welcome#index'

end
