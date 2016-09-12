class SessionController < ApplicationController
  skip_before_action :user_logged_in?

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: user_params[:email])
    if @user && @user.authenticate(user_params[:password])
      reset_user_session
      session[:user] = @user.id
      redirect_to params[:referer].present? ? params[:referer] : users_path
    else
      @user = User.new
      flash.now[:referer] = params[:referer]
      flash.now[:error] = true
      render :new
    end
  end

  def delete
    reset_user_session
    redirect_to session_index_url
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :role)
  end


end
