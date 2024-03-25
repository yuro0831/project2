Rails.application.routes.draw do
  get 'rooms/show'
  
  devise_for :users
  resources :users, :only => [:index, :show]
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'projects/search' => 'projects#search'
  get 'projects/ranking' => 'projects#ranking'
  resources :users
  resources :projects do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
 
root 'projects#index'
end