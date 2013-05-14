class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  enable_authorization

  respond_to :html

  before_action :log_user_info

  # returns current +User+ if logged in
  # * *Returns* :
  #   - +User+ instance if logged in, otherwise nil
  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  private

  def log_user_info
    logger.info "  user_id: #{session[:user_id]}, request_ip: #{request.ip}, session_id: #{session.id}" if session[:user_id]
  end
end
