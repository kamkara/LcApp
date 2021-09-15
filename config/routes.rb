Rails.application.routes.draw do
  get "team", to:'partner#team'
  get "partenr", to:'partner#partner'
  resources :courses, :city_areas, :levels, :materials 
  get 'admin/index'
  get 'admin/create'
  get 'admin/dashboard'
  get 'admin/table'
  root to:'home#index'
  
  devise_scope :user do
    get 'profile/edit'    => 'devise/registrations#edit',   :as => :edit_user_registration
    get 'profile/cancel'  => 'devise/registrations#cancel', :as => :cancel_user_registration
  end

  devise_for  :users,
              :path => '',
              :path_names => {  :sign_in =>       'connexion',
                                :sign_out =>      'logout',
                                :sign_up =>       '',
                                :registration =>  'inscription',
                                :edit =>          'edit',
                                 }
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
