class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  protect_from_forgery with: :exception

    def after_sign_in_path_for(resource)
    stored_location_for(resource) || home_path
    end

    helper_method :resource_name, :resource, :devise_mapping

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end


  def authenticate_user!
      if user_signed_in?
        super
      else
        redirect_to new_user_session_path, :notice => 'PLEASE LOG IN FIRST!!'
      end
  end
  
  
end
