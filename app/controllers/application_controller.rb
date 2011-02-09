class ApplicationController < ActionController::Base
  protect_from_forgery

  #helper_method :usuario_logged, :usuario_logged?


  def authenticate
    redirect_to new_session_path if session[:usuario].nil?
  end

end

