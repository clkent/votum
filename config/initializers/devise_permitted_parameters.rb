module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_filter :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first << :last << :phone << :address << :city << :state << :zip
    devise_parameter_sanitizer.for(:account_update) << :first << :last << :phone << :address << :city << :state << :zip
  end

end

DeviseController.send :include, DevisePermittedParameters