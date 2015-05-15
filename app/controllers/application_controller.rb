class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :layout_by_resource

  protected

  def after_sign_in_path_for(id)
    user_path(id)
  end

  def layout_by_resource
    if devise_controller?
      'application'
    else
      'layout_for_user'
    end
  end


end
