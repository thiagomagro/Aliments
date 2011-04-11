class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def authenticate
    redirect_to new_session_path if session[:usuario].nil?
  end
  
  def admin_auth
    redirect_to "/" unless usuario_admin?
  end
  
end

