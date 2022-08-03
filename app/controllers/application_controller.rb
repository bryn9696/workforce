class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!current_user
  end

  def signed_in?
    !!current_user
  end

  def common_organisation
    # All controllers' actions have queried the DB and set @foo for me...
    @org = @organisation
    # ... and all templates expect @bar to bet set.
  end
end
