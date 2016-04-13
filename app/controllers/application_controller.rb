class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

def set_admin_timezone
  Time.zone = 'Pacific Time (US & Canada)'
end

  protected

  def configure_permitted_parameters
	devise_parameter_sanitizer.for(:sign_up) do |u| 
		u.permit( :email, :password, :password_confirmation, :subscribed, :first, :last, :address, :city, :state, :zip, :phone, :reset_password_token, :reset_password_sent_at
)
	end
    devise_parameter_sanitizer.for(:account_update) do |u|
    	u.permit( :email, :password, :password_confirmation, :subscribed, :first, :last, :address, :city, :state, :zip, :phone, :reset_password_token, :reset_password_sent_at
) 
  	end
  end
end
