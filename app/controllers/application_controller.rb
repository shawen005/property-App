class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters 
  devise_parameter_sanitizer.permit(:sign_up, keys: [:account,:email,:remember_me, :avatar,:name,:phone,:avatar_cache])                       
 
  devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :password, :password_confirmation, :current_password, :avatar, :avatar_cache, :remove_avatar) } 
  end 
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageContent

   private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource)
   listings_path
end

def login
  @latest = Listing.recent.latest

  end
end