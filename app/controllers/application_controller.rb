class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  http_basic_authenticate_with(name: Rails.application.secrets.admin_username,
                               password: Rails.application.secrets.admin_password)
end
