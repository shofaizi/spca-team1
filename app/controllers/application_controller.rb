class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_user
    redirect_to new_user_path, alert: 'please sign in' unless user_signed_in?
  end

  def user_signed_in?
    session[:user_id].present?
  end
  helper_method :user_signed_in? # adding this line makes this mehtod accessible
                                 # in view files. Because this method is in the
                                 # ApplicationController then it's accessible to
                                 # all views.

  def current_user
    @current_user ||= User.find(session[:user_id]) if user_signed_in?
  end
  helper_method :current_user

  # def current_case_id
  #   @current_case_id = ||= Report.find(session[:report_id])
  # end
  # helper_method :current_case_id

end
