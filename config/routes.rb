Blocitoff::Application.routes.draw do

  devise_for :users
  resources :users, only: [:update]

  resources :lists do
    resources :tasks
  end

  
  
  resources :todos, only: [:new]


  authenticated :user do
    root to: 'lists#index', as: 'authenticated_root'
  end

  get 'about' => 'welcome#about'
  
  root to: 'welcome#index'

end
