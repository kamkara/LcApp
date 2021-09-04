Rails.application.routes.draw do
  get 'admin/index'
  get 'admin/create'
  get 'admin/dashboard'
  get 'admin/table'
  devise_for :users
  root to:'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
