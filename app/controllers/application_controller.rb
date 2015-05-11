require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  around_filter :set_time_zone, :if => :current_user
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :sanitize_flash_params, if: :flash_keys_present?

  def after_sign_in_path_for(resource)
    profile_documents_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:name, :phone_number]
  end

  def flash_keys_present?
    flash.keys.any?
  end

  def sanitize_flash_params
    if flash[:notice].present?
      flash[:success] = flash[:notice]
      flash.delete(:notice)
    end
  end

  def set_time_zone(&block)
    time_zone = current_user.timezone || "UTC"
    Time.use_zone(time_zone, &block)
  end
end
