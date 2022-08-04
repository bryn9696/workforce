class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :current_organisation
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_organisation
    @current_organisation = Organisation.first
  end

  # def hours_worked
  #   (((@shift.finish_time.hour.minute + @shift.finish_time.min).to_f - (@shift.start_time.hour.minute + @shift.start_time.min) - @shift.break_length.to_i) / 60).to_f.round(2)
  # end
  
  def logged_in?
    !!current_user
  end

  # def signed_in?
  #   !!current_user
  # end


end
