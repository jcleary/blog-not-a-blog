class ApplicationController < ActionController::Base
  include CanCan::ControllerAdditions
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    short_user_path(resource)
  end
end
