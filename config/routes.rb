Rails.application.routes.draw do
  resources :courses
  resources :city_areas
  resources :levels
  resources :materials
  get 'admin/index'
  get 'admin/create'
  get 'admin/dashboard'
  get 'admin/table'
  root to:'home#index'
  devise_for :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
