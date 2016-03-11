module ApplicationHelper
 def resource_name
    :user
  end

  def resource_class 
     User 
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def devise_flash
    if controller.devise_controller? && resource.errors.any?
      flash.now[:error] = flash[:error].to_a.concat resource.errors.full_messages
      flash.now[:error].uniq!
    end
  end
  
end

