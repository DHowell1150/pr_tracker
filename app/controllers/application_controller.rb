class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @_current_user ||= User.find(session[:user_id]) if session[:user_id] && User.exists?
    # @current_user ||= User.find_by(id: session[:user])
  end
end
