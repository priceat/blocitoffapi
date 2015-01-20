Blocitoffapi::Application.routes.draw do

 devise_for :users
  resources :users, only: [:update, :show, :index]

  resources :lists do
    resources :tasks

  end


  namespace :api do
    resources :users, only: [:update, :show, :index]
    resources :lists do
      resources :tasks
    end
  end



  
  



  authenticated :user do
    root to: 'lists#index', as: 'authenticated_root'
  end

  get 'about' => 'welcome#about'
  
  root to: 'welcome#index'

end
