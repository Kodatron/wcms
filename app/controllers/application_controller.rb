class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include SessionsHelper
  protect_from_forgery with: :exception
  before_action :set_locale

  def init_api
    @wow ||= WowApi.new
    @wow
  end

  def check_admin
    if current_user && logged_in?
      true
    else
      redirect_to "/", alert: "Du måste vara inloggad för detta."
    end
  end

  def login_required
    if current_user && logged_in?
      true
    else
      redirect_to login_path, alert: "Du måste vara inloggad för detta."
    end
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def resource_updated_flash
  t(:Resource_updated, resource: controller_name.classify.constantize.model_name)
  end

  def resource_remove_error_flash
    t(:Resource_remove_error, resource: controller_name.classify.constantize.model_name.human_definite)
  end

  def resource_created_flash
    t(:Resource_created, resource: controller_name.classify.constantize.model_name.human)
  end

end
