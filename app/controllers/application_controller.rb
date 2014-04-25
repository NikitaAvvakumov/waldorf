class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_login
    unless admin_signed_in?
      redirect_to new_admin_session_path, flash: { warning: 'You must sign in.' }
    end
  end
end
