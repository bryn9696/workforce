class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :current_organisation
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_organisation
    @current_organisation = Organisation.find(11)
  end
  
  def logged_in?
    !!current_user
  end

  # def signed_in?
  #   !!current_user
  # end


end
