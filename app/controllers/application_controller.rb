class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :find_cityAreas
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    # If you have extra params to permit, append them to the sanitizer.
    def configure_permitted_parameters
    sign_up_params          = [ :first_name, :last_name, :full_name, :matricule, :contact, :city, :role,
                              :email, :password, :slug, :gender]
    complet_sign_up_params  = [ :school_name, :serie_bac, :status_bac, :avatar_profil, :status_payment]
     
    devise_parameter_sanitizer.permit :sign_up, keys: sign_up_params
      devise_parameter_sanitizer.permit :account_update, keys: complet_sign_up_params
      devise_parameter_sanitizer.permit :sign_in, keys: [:logged, :password]
    end 
  private
  def find_levels
    @levels = Level.all
  end
  def find_cityAreas
    @cityAreas = CityArea.all
  end
end
