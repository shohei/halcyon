class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_action :user_logged_in?

  def reset_user_session
    session[:user] = nil
    @current_user = nil
  end

  def user_logged_in?
    user_id = session[:user]
    if user_id then
      begin
        @current_user = User.find(user_id)
      rescue ActiveRecord::RecordNotFound
        reset_user_session
      end
    end

    unless @current_user
      flash[:referer] = request.fullpath
      redirect_to :root 
    end
  end
end
