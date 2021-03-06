  class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    def after_sign_in_path_for(resource)
      sign_in_url = new_admin_user_session_url
      if request.referer == sign_in_url
        super
      else
        stored_location_for(resource) || request.referer || participants_path
      end
    end

    def after_sign_out_path_for(_resource)
      root_path
    end

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password) }
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :current_password) }
    end
  end
