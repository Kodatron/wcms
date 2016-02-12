class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  def check_admin
    return true
    redirect_to "/", alert: "Du måste vara inloggad för detta."
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def resource_updated_flash
  t(:Resource_updated, resource: controller_name.classify.constantize.model_name.human_definite.capitalize)
  end

  def resource_remove_error_flash
    t(:Resource_remove_error, resource: controller_name.classify.constantize.model_name.human_definite)
  end

  def resource_created_flash
    t(:Resource_created, resource: controller_name.classify.constantize.model_name.human)
  end

end
